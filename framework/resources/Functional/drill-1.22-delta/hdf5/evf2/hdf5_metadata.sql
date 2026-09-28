-- expected: upstream TestHDF5Format.testStarQuery: one 4x6 int dataset '/dset', 24 elements, 96 bytes
select path, data_type, file_name, data_size, element_count, dataset_data_type, dimensions from table(`drill-1.22-delta/hdf5/dset.h5`(type => 'hdf5'))
