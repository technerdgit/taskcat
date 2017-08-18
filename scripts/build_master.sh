#/bin/bash -x
# Get pip creds
cp scripts/setup_stub-develop.py ./setup_stub-develop.py
cp beautycorn.py bin/beautycorn
cp alchemist.py bin/alchemist
cp taskcat.py bin/taskcat
# Update Pip Version
cp scripts/setup_stub-master.py ./setup_stub-master.py
# Update Pip Version
python3 -c 'import datetime; print (open("./setup_stub-master.py").read().replace("VERSION_STUB",datetime.datetime.now().strftime("%Y.%m%d.%H%M%S")+".dev0"))' >setup.py
# Push to test pypi
python3 setup.py sdist && twine-3 upload dist/* -r test
