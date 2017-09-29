# lxml library is needed 
from lxml import etree

# Location of XML file
XML_FILE = "YOUR_XML_DIR"
# Load the XML File in read mode
xfile = open(XML_FILE, 'r')
# Create a etree instance with the XML content
xml_tree = etree.XML(xfile.read())

# Find all Name nodes with xpath
name_nodes = xml_tree.xpath("//Name")
for x, name_node in enumerate(name_nodes):
    print("Node %s: %s" % (str(x), name_node.text))

# Find elements in xml_file based in the xpath query
def find_nodes(xml_tree_node, xpath_query):
    for x, node in enumerate(xml_tree_node.xpath(xpath_query)):
        print("Node %s: %s" % (str(x), node.text))
