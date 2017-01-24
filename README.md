# glider
Run Masterminds/Glide in a centos container from OSX


## Build
  cd <glide_root>
  
  docker build -t glider .

## Run
  cd <golang_repo>
  
  docker run -it -v $(pwd):/code -v ~/.ssh:/root/.ssh glider
