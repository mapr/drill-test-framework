package org.apache.drill.test.framework;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Preconditions;

import oadd.com.google.common.base.Strings;

import java.io.BufferedReader;
import java.io.Closeable;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * Shell runner which execute shell cmd using Runtime.getRuntime().exec(cmd),
 * NOTE: Both standard error stream and standard output stream of the Process have to be consumed. Otherwise hang will occasionally occurs like ghost.
 * The JDK's Javadoc documentation provides the answer to this question: Because some native platforms only provide limited buffer size for standard input and output streams,
 * failure to promptly write the input stream or read the output stream of the subprocess may cause the subprocess to block, or even deadlock.
 */
public enum ShellRunner implements Closeable {
	INSTANCE;

	private static final Logger LOG = LoggerFactory.getLogger(ShellRunner.class);
	private ExecutorService executors = Executors.newCachedThreadPool();

	public  CmdConsOut execCmd(String cmd)  {
		Preconditions.checkArgument(!Strings.isNullOrEmpty(cmd), "cmd is invalid");
		Process process = null;
		int exitCode = -1;
		CmdConsOut cmdConsOut = new CmdConsOut();
		cmdConsOut.cmd = cmd;
		try {
			process = Runtime.getRuntime().exec(cmd);
			// create two stream consumers which are working simultaneously, one for consuming standard output stream, the other one for consuming error stream
			Future<String>[] redirectTasks = createStreamConsumerTasks(process);
			exitCode = process.waitFor();
			// check whether everything is ok for two stream consumers
			String[] standardOutputAndError = fetchStandardOutputAndError(redirectTasks);
			if(exitCode != 0) {
				LOG.warn("Fail to run command {}, errMgs:\n {}", cmd, standardOutputAndError[1]);
			}
			cmdConsOut.exitCode = exitCode;
			cmdConsOut.consoleOut = "standard output : \n" + standardOutputAndError[0] + "\n standard error: \n" + standardOutputAndError[1];
			return cmdConsOut;
		} catch (Throwable e) {
			LOG.warn("Fail to run command " + cmd, e);
			cmdConsOut.exitCode = exitCode;
			cmdConsOut.consoleOut = e.getMessage();
			return cmdConsOut;
		} finally {
			// destroy process
			if (process != null) {
				process.destroy();
				process = null;
			}
		}
	}

	private Future<String>[] createStreamConsumerTasks(Process p) {
		ProcessStreamConsumer outStreamConsumer = new ProcessStreamConsumer(p.getInputStream(), ProcessStreamConsumer.StreamType.OUT);
		ProcessStreamConsumer errorStreamConsumer =
				new ProcessStreamConsumer(p.getErrorStream(), ProcessStreamConsumer.StreamType.ERROR);
		Future<String> outConsumerTask = executors.submit(outStreamConsumer);
		Future<String> errorConsumerTask = executors.submit(errorStreamConsumer);
		return new Future[] { outConsumerTask, errorConsumerTask };
	}


	private String[] fetchStandardOutputAndError(Future<String>[] consumerTasks) throws Exception {
		String[] standardOutputAndError = new String[consumerTasks.length];
		for(int i = 0; i < consumerTasks.length; i++) {
			try {
				standardOutputAndError[i] = consumerTasks[i].get();
			} catch (ExecutionException e) {
				throw new RuntimeException("error happened when consumer standard output or standard error", e.getCause());
			}
		}
		return standardOutputAndError;
	}

	@Override
	public void close() {
		executors.shutdown();
	}

	/**
	 * stream consumer
	 */
	private static class ProcessStreamConsumer implements Callable<String> {
		private static final Logger LOG = LoggerFactory.getLogger(ProcessStreamConsumer.class);

		private InputStream in;
		private StreamType streamType;

		public ProcessStreamConsumer(InputStream in, StreamType streamType) {
			this.in = in;
			this.streamType = streamType;
		}


		@Override
		public String call ()throws Exception {
			StringBuilder sb = new StringBuilder();
			try (BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {
				String line = null;
				while ((line = reader.readLine()) != null) {
					switch (this.streamType) {
						case OUT:
							LOG.debug("out > {}", line);
							sb.append(line + "\n");
							break;
						case ERROR:
							LOG.debug("error > {}", line);
							sb.append(line + "\n");
							break;
						default:
							break;
					}
				}

			}
			return sb.toString();
		}

		enum StreamType {
			OUT, ERROR;
		}
	}
}