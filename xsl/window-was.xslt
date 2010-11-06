<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output xmlns="http://www.w3.org/TR/xhtml1/strict" doctype-public="-//W3C//DTD XHTML 1.0 Frameset//EN" encoding="utf-8" indent="yes" method="html" omit-xml-declaration="no" version="1.0" media-type="text/xml"/>

<xsl:template match="/">
	<html>
		<head>
			<title></title>
			<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
			<link rel="shortcut icon" href="/favicon.ico" />
			<link rel="stylesheet" href="/css/rightside.css" type="text/css" />
			
		</head>
		<xsl:apply-templates />
	</html>
</xsl:template>

<xsl:template match="/vframes">
		<frameset frameborder="0" border="0" framespacing="1">
			<xsl:attribute name="rows">
				<xsl:value-of select="balance" />
			</xsl:attribute>
			<frame id="top-f" name="top-f" scrolling="no">
				<xsl:attribute name="src">
					<xsl:value-of select="top" />
				</xsl:attribute>
			</frame>
			<frame id="bot-f" name="bot-f" scrolling="no">
				<xsl:attribute name="src">
					<xsl:value-of select="bot" />
				</xsl:attribute>
			</frame>
		</frameset>
</xsl:template>

<xsl:template match="/frame">
	<xsl:choose>
		<xsl:when test="type='descr'">
			<body>
				<table id="bot-bot">
					<tr>
						<td id="content">
							<div class="scroller">
								<xsl:copy-of select="content" />
							</div>
						</td>
					</tr>
				</table>
			</body>
		</xsl:when>
		<xsl:otherwise>
			<body>
				<table id="top-top">
					<tr>
						<td id="tabbox">
							<img class="to-max" src="/pics/to-max.gif" alt="[]" onclick="maxitop()" />
							<img class="to-minimax" src="/pics/to-minimax.gif" alt="=" onclick="minimaxi()" />
							<img class="to-min" src="/pics/to-min.gif" alt="_" onclick="minitop()" />
							<div id="fzag"></div>
							 <ul id="tabs">
								<li id="model">
									<xsl:if test="type='model'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="model.xml">Модель</a>
								</li>
								<li id="scheme">
									<xsl:if test="type='scheme'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="scheme.xml">Схема</a>
								</li>
								<li id="photo">
									<xsl:if test="type='photo'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="photo.xml">Фото</a>
								</li>
								<li id="video">
									<xsl:if test="type='video'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="video.xml">Видеокадры</a>
								</li>
								
							</ul>
							<div id="current-system-title"></div>
						</td>
					</tr>
					<tr>
						<td id="content">
							<!--<div class="scroller">-->
								<!--<xsl:copy-of select="content" />-->
								<xsl:apply-templates select="content" />
							<!--</div>-->
						</td>
					</tr>
				</table>
			</body>
		</xsl:otherwise>
	</xsl:choose>	
</xsl:template>

<xsl:template match="/singleton">
		<body>
			<table id="bot-bot">
				<tr>
					<td id="divider"></td>
				</tr>
				<tr>
					<td id="content">
						<div class="scroller">
							<xsl:apply-templates />
						</div>
					</td>
				</tr>
			</table>
		</body>
</xsl:template>

<xsl:template match="shortcuts/group/shortcut">
	<span class="ss-group">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="link" />
			</xsl:attribute>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="image" />
				</xsl:attribute>
			</img>
		</a>
		<br/>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="link" />
			</xsl:attribute>
			<xsl:value-of select="title" />
		</a>
	</span>
</xsl:template>

<xsl:template match="shortcuts/group">
	<div class="shortcuts">
			<xsl:value-of select="title" />
			<xsl:apply-templates select="shortcut" />
	</div>
</xsl:template>

<xsl:template match="shortcuts">
	<div class="scroller">
		<xsl:apply-templates select="group" />
	</div>
</xsl:template>

<xsl:template match="html">
	<div class="scroller">
		<xsl:copy-of select="*" />
	</div>
</xsl:template>

<xsl:template match="flash">
	<div class="scroller">
		<object type="application/x-shockwave-flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="100%" height="100%" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0">
			<xsl:attribute name="data">
				<xsl:value-of select="text()" />
			</xsl:attribute>
			<param name="quality" value="best" />
			<param name="wmode" value="transparent" />
			<param name="movie">
				<xsl:attribute name="value">
					<xsl:value-of select="text()" />
				</xsl:attribute>
			</param>
		</object>
	</div>
</xsl:template>

<xsl:template match="svg">
	<div class="scroller">
	<!--<object type="image/svg+xml" data="/pics/pdul_to.svg" width="100%" height="99%" codebase="http://www.adobe.com/svg/viewer/install/">
		<xsl:attribute name="data">
			<xsl:value-of select="text()" />
		</xsl:attribute>
		<param name="movie">
			<xsl:attribute name="value">
				<xsl:value-of select="text()" />
			</xsl:attribute>
		</param>-->
		<embed type="image/svg+xml" pluginspage="http://www.adobe.com/svg/viewer/install/" height="99%" width="100%">
			<xsl:attribute name="src">
				<xsl:value-of select="text()" />
			</xsl:attribute>
		</embed>
	<!--</object>-->
	</div>
</xsl:template>

<xsl:template match="wrml">
	<div class="scroller">
		<object classid="clsid:86A88967-7A20-11d2-8EDA-00600818EDB1" width="100%" height="100%" codebase="http://www.parallelgraphics.com/bin/cortvrml.cab#Version=4,2,0,93">
			<param name="RendererOptimization" value="1" />
			<param name="vrml_splashscreen" value="false" />
			<param name="vrml_dashboard" value="false" />
			<param name="Scene">
				<xsl:attribute name="value">
					<xsl:value-of select="text()" />
				</xsl:attribute>
			</param>
		</object>
	</div>
</xsl:template>

<xsl:template match="image">
	<div class="scroller">
		<img alt="">
			<xsl:attribute name="src">
				<xsl:value-of select="text()" />
			</xsl:attribute>
		</img>
	</div>
</xsl:template>

<xsl:template match="content/dualview">
	<iframe frameborder="0" scrolling="no"  height="100%" width="50%">
		<xsl:attribute name="src">
			<xsl:value-of select="volume" />
		</xsl:attribute>
	</iframe>
	<iframe frameborder="0" height="100%" width="49.9%">
		<xsl:attribute name="src">
			<xsl:value-of select="plain" />
		</xsl:attribute>
	</iframe>
</xsl:template>


<xsl:template match="iframe">
	<iframe width="100%" height="100%">
		<xsl:attribute name="src">
			<xsl:value-of select="@src"/>
		</xsl:attribute>
	</iframe>
</xsl:template>

</xsl:stylesheet>