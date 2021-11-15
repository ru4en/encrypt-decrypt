#!/bin/bash

if [ $1 == '-e' ] || [ $1 == '--encrypt' ]; #if user in put
then
  zip -r $2 $2
  gpg --output $2.gpg --symmetric $2.zip && rm $2 -rf
  rm $2.zip
  echo 'Encrypted '$2'...'

elif [ $1 == '-d' ] || [ $1 == '--decrypt' ];
then
  gpg --output "${2%.*}".zip -d $2 && mv $2 .$2.old
  unzip "${2%.*}".zip
  rm "${2%.*}".zip
elif [ $1 == '-h' ] || [ $1 == '--help' ];
then
  echo 'Usage: ./ende.sh [OPTION]... [FILE]...
  Encrypt and Decrypt files and folders.
  Make sure you have gpg and zip installed.

  Arguments:

  -e, --encrypt   Encrypt file or folders.
  -d, --decrypt   Decrypt files and folders.'

else
  echo 'invalid option Try '--help' for more information.'
fi

#if i == encrypt
 # gpg --output test.gpg --symmetric $1

#if i == --decrypt or
 # gpg --output test.gpg --symmetric $1

