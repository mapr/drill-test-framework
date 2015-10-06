/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.drill.test.framework;

import java.util.Collection;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class CancelingExecutor implements AutoCloseable {

  private final ExecutorService executor;
  private final ExecutorService runner = Executors.newCachedThreadPool();
  private final ExecutorService canceler = Executors.newCachedThreadPool();
  private final int timeout;

  private CountDownLatch latch;
  private Exception exception;
  private Thread mainThread;

  public CancelingExecutor(int numberConcurrentTasks, int timeout) {
    executor = Executors.newFixedThreadPool(numberConcurrentTasks);
    this.timeout = timeout;
  }

  public void executeAll(final Collection<? extends Cancelable> tasks) throws Exception {
    mainThread = Thread.currentThread();
    latch = new CountDownLatch(tasks.size());
    for (Cancelable task : tasks) {
      execute(task);
    }
    try {
      latch.await();
    } catch (InterruptedException e) {
      Thread.currentThread().interrupt(); // preserve evidence that interrupt occurred
      if (exception != null) {
        throw exception;
      } else {
        throw e;
      }
    }
  }

  private void execute(final Cancelable task) {
    executor.submit(new Runnable() {
      @Override
      public void run() {
        final Future future = runner.submit(task);
        final Future cancelFuture = canceler.submit(new Runnable() {
          @Override
          public void run() {
            try {
              future.get(timeout, TimeUnit.SECONDS);
            } catch (TimeoutException e) {
              task.cancel();
            } catch (ExecutionException | InterruptedException e) {
              throw new RuntimeException(e);
            }
          }
        });
        try {
          cancelFuture.get();
          latch.countDown();
        } catch (ExecutionException | InterruptedException e) {
          fail(e);
        }
      }
    });
  }

  @Override
  public void close() {
    executor.shutdown();
    runner.shutdown();
    canceler.shutdown();
  }

  private void fail(Exception e) {
    exception = e;
    mainThread.interrupt();
  }

}
