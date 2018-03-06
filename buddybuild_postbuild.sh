#!/usr/bin/env bash

echo "listing build dir in postbuild"
echo $BUDDYBUILD_PRODUCT_DIR
ls $BUDDYBUILD_PRODUCT_DIR

bash <(curl -s https://codecov.io/bash)

test_runner="XCUITests-Runner"

# comment out the section where it upload the testrunner
if [ "$BUDDYBUILD_SCHEME" = "Fennec" ]; then
#  (cd $BUDDYBUILD_TEST_DIR/Build/Products/Fennec-iphonesimulator \
#	&& zip -r $test_runner.zip $test_runner.app)
  curl -F ipa=@$BUDDYBUILD_IPA_PATH \
#      -F test_runner=@$BUDDYBUILD_TEST_DIR/Build/Products/Fennec-iphonesimulator/$test_runner.zip -F \
#	test_identifiers="DomainAutocompleteTest.testAutocomplete" \
       -u $NIMBLEDROID_API_KEY: https://nimbledroid.com/api/v2/ipas
fi

