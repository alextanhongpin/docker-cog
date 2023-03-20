# docker-cog

Tutorial [here](https://github.com/replicate/cog/blob/main/docs/getting-started.md).

## Setup venv


```bash
$ python3 -m venv venv
$ source venv/bin/activate
$ (venv) pip install <your-dep>

# To generate lockfile.
$ (venv) pip freeze > requirements.txt

# To install from lockfile.
$ (venv) pip install -r requirements.txt

$ deactivate
```


## Steps

First, run this to get some pre-trained model weights:


```bash
WEIGHTS_URL=https://storage.googleapis.com/tensorflow/keras-applications/resnet/resnet50_weights_tf_dim_ordering_tf_kernels.h5
curl -O $WEIGHTS_URL
```

Sample image to test on:

```bash
IMAGE_URL=https://gist.githubusercontent.com/bfirsh/3c2115692682ae260932a67d93fd94a8/raw/56b19f53f7643bb6c0b822c410c366c3a6244de2/mystery.jpg
curl $IMAGE_URL > input.jpg
```

Run prediction:

```bash
cog predict -i image=@input.jpg
```
