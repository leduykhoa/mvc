#!/bin/bash

echo "Bash version ${BASH_VERSION}..."

# ./cli_copy_to_success.sh

CWD=$(basename "$PWD")
date=`date +%Y%m%d_%H%M%S`
path="$PWD/.."
name=$CWD"_"$date

if [ ! -d $path/$name ]; then
    rm -rf $path/$name
fi

mkdir -p $path/$name
cp -rf ./c $path/$name/
cp -rf ./config $path/$name/
cp -rf ./database $path/$name/
cp -rf ./docker $path/$name/
cp -rf ./lib $path/$name/
cp -rf ./m $path/$name/
cp -rf ./middleware $path/$name/
cp -rf ./public $path/$name/
cp -rf ./route $path/$name/
cp -rf ./service $path/$name/
cp -rf ./test $path/$name/
cp -rf ./test_back $path/$name/
cp -rf ./test_report $path/$name/
cp -rf ./v $path/$name/
cp -rf ./.env $path/$name/.env
cp -rf ./.env.example $path/$name/.env.example
cp -rf ./.gitignore $path/$name/
cp -rf ./cli_copy_to_success.sh $path/$name/
cp -rf ./cli_docker_build.sh $path/$name/
cp -rf ./cli_git_cmd.sh $path/$name/
cp -rf ./cli_mvc $path/$name/
cp -rf ./cli_package.sh $path/$name/
cp -rf ./docker-compose.yml $path/$name/
cp -rf ./languages.js $path/$name/
cp -rf ./news.js $path/$name/
cp -rf ./news.json $path/$name/
cp -rf ./package-lock.json $path/$name/
cp -rf ./package.json $path/$name/
cp -rf ./PHP-MVC-Skeleton.jmeter.jmx $path/$name/
cp -rf ./PHP-MVC-Skeleton.postman_collection.json $path/$name/
cp -rf ./PHP-MVC-Skeleton.postman_environment.json $path/$name/
cp -rf ./pluralize.js $path/$name/
cp -rf ./postcss.config.js $path/$name/
cp -rf ./README.md $path/$name/
cp -rf ./render_table_file.js $path/$name/
cp -rf ./render_table_file.json $path/$name/
cp -rf ./tailwind.config.js $path/$name/
cp -rf ./vite.config.backend.js $path/$name/
cp -rf ./vite.config.js $path/$name/

rm -rf $path/$name/public/assets*
rm -rf $path/$name/public/backend-assets*
rm -rf $path/$name/public/images*

tar -cvzf $PWD/../$name.tar.gz $path/$name/
