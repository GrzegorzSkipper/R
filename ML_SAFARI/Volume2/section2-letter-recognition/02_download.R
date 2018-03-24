library(R.utils)

# MNIST handwriting set hosted on http://yann.lecun.com/exdb/mnist/
data <- 
  data.frame(
    URL = c('http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz',
            'http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz',
            'http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz',
            'http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz'),
    destination = c('train_data',
                    'train_labels',
                    'test_data',
                    'test_labels'),
    stringsAsFactors = FALSE
  )

row.names(data) <- data$destination

mnist_path <- 'Volume2/section2-letter-recognition/mnist/'

process_file <- function(url, name) {
  fname = paste(mnist_path, name, sep = "")
  gzfile = paste(fname, ".gz", sep = "")
  if(!file.exists(gzfile)) {
    download.file(url, destfile = gzfile) 
  } else {
    print(paste("Already downloaded", url))
  }
  if(!file.exists(fname)) {
    gunzip(gzfile, remove = FALSE)
  } else {
    print(paste("Already unzipped", gzfile))
  }
}

mapply(process_file, data$URL, data$destination)

# adapted from https://gist.github.com/brendano/39760 by Brendan O'Connor
load_mnist <- function() {
  load_image_file <- function(filename) {
    ret = list()
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')
    ret$n = readBin(f,'integer',n=1,size=4,endian='big')
    nrow = readBin(f,'integer',n=1,size=4,endian='big')
    ncol = readBin(f,'integer',n=1,size=4,endian='big')
    x = readBin(f,'integer',n=ret$n*nrow*ncol,size=1,signed=F)
    ret$x = matrix(x, ncol=nrow*ncol, byrow=T)
    close(f)
    ret
  }
  load_label_file <- function(filename) {
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')
    n = readBin(f,'integer',n=1,size=4,endian='big')
    y = readBin(f,'integer',n=n,size=1,signed=F)
    close(f)
    y
  }
  gp <- function(fname) { 
    return(paste(mnist_path, fname, sep = ""))
  }
  mtrain <<- load_image_file(gp(data['train_data',]$destination))
  mtest <<- load_image_file(gp(data['test_data',]$destination))
  
  mtrain$y <<- load_label_file(gp(data['train_labels',]$destination))
  mtest$y <<- load_label_file(gp(data['test_labels',]$destination))  
}

load_mnist()

show_digit <- function(arr784, col=gray(12:1/12), ...) {
  image(matrix(arr784, nrow=28)[,28:1], col=col, ...)
}

