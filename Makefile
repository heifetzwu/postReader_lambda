# gowebmvc_lambda
build:
	cd getPostUri && $(MAKE)
	cd newPostUri && $(MAKE)
	cd convertPostUri && $(MAKE)
	
echo:
	echo "1" 
	cd getInfo && $(MAKE)
package:
	sam package --template-file template.yaml --output-template-file package.yaml --s3-bucket jackpollywebsite4
deploy:
	sam deploy --template-file package.yaml --stack-name postReader --capabilities CAPABILITY_IAM
test:
	sam local start-api
.PHONY: build echo package deploy