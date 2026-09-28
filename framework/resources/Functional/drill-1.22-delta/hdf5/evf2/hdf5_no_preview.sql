-- expected: showPreview=false still returns the metadata row (upstream testStarQueryWithoutPreview)
select path, element_count from table(`drill-1.22-delta/hdf5/dset.h5`(type => 'hdf5', showPreview => false))
