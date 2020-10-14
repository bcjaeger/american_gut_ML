

the_plan <- drake_plan(

  # create main dataset for analysis
  otu = make_otu_data(file_path_meta = "data/source/ag.txt",
                      file_path_biom = "data/source/AG.biom",
                      site_variable = "SAMPLE_TYPE",
                      site_name = "Stool"),

  # creates resamples.csv (used for slurm)
  resamples = mc_cv_light(data = otu, train_prop = 2/3, ntimes = 500),

  model_rf = make_rf(otu, outcome = 'appendix_removed', max_otus = 16500)

)
