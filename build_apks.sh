echo ""
if [ -z "$1" ]
then
  echo "ERROR"
  echo "no target path set for APK"
  echo "example of expected usage' ./build_apks.sh ~/myapks '"
  echo ""
  exit
fi

mkdir $1

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++                      building 32bit APK                      ++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
docker run -ti --rm -v $1:/output crumpet_builder_32bit_kde:latest
echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "++                      building 64bit APK                      ++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
docker run -ti --rm -v $1:/output crumpet_builder_64bit_kde:latest
echo ""
echo "================================================"
echo "= APKs built, please find build output folders ="
echo "=            at the following path             ="
echo "================================================"
echo ""
echo "build output path = " $1
echo ""