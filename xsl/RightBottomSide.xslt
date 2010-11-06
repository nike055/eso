<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output xmlns="http://www.w3.org/TR/xhtml1/strict" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" encoding="utf-8" indent="yes" method="html" omit-xml-declaration="no" version="1.0" media-type="text/xml"/>

	<xsl:include href="RightSideTemplates.xslt"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title></title>
				<link rel="stylesheet" type="text/css" href="../../../css/RightBottomSide.css" />
				<script type="text/javascript" src="../../../js/rightside.js"></script>
			</head>
			<xsl:apply-templates />
		</html>
	</xsl:template>
</xsl:stylesheet>
