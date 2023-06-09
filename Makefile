predict-local:
	@cog predict -i image=@input.jpg


build:
	@cog build -t resnet


debug:
	@cog debug dockerfile


predict-build: build
	@cog predict resnet -i image=@input.jpg


server: build
	@docker run -d --rm -p 5000:5000 resnet


curl: server
	@http://localhost:5000/predictions -X POST \
    -H 'Content-Type: application/json' \
    -d '{"input": {"image": "https://gist.githubusercontent.com/bfirsh/3c2115692682ae260932a67d93fd94a8/raw/56b19f53f7643bb6c0b822c410c366c3a6244de2/mystery.jpg"}}'
