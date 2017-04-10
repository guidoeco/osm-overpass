mv test.xml test.xml.1 || true
wget --output-document=test.xml http://osm3s-server/api/interpreter?data=%3Cprint%20mode=%22body%22/%3E
diff test.xml test.xml.0

mv pub.xml pub.xml.1 || true
wget -O pub.xml --post-file=query.xml "http://osm3s-server/api/interpreter"
diff pub.xml pub.xml.0
