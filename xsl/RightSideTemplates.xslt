<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output xmlns="http://www.w3.org/TR/xhtml1/strict" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" encoding="utf-8" indent="yes" method="html" omit-xml-declaration="no" version="1.0" media-type="text/xml"/>
	
	<xsl:template match="/vframes">
		<!--<frameset frameborder="0" border="0" framespacing="1">
		
			<xsl:attribute name="rows">
				<xsl:value-of select="balance" />
			</xsl:attribute>-->
			<iframe id="top-f" width="100%" height="50%" name="top-f" scrolling="no">
				<xsl:attribute name="src">
					<xsl:value-of select="top" />
				</xsl:attribute>
			</iframe>
			<iframe id="bot-f" width="100%" height="50%" name="bot-f" scrolling="no">
				<xsl:attribute name="src">
					<xsl:value-of select="bot" />
				</xsl:attribute>
			</iframe>
		<!--</frameset>-->
	</xsl:template>
	
	<!-- //PS 15/03/2010 templates serve 'radio selector'  purposes -->
	<xsl:template match="@*|node()" priority="-1">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="input[@type='radio' and contains(@value,'#')]">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
			<xsl:attribute name="name">anchor_radio</xsl:attribute>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="div[@id='GoRadio']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<input type="button" value="OK" OnClick="GoRadio();" style="width:100px; margin-right:10px;"/>
			<input type="reset" value="CANCEL"  style="width:100px; "/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="div[@id='GoRadioLevel1']">
		<input type="button" value="OK" OnClick="GoRadioLevel1();" style="width:100px; margin-right:10px;"/>
		<input type="button" value="CANCEL" OnClick="ResetRadioLevel1();"  style="width:100px; "/>
	</xsl:template>
	<xsl:template match="div[@id='GoRadioLevel2']">
		<input type="button" value="OK" OnClick="GoRadio();" style="width:100px; margin-right:10px;"/>
		<input type="button" value="CANCEL" OnClick="ResetRadioLevel2();"  style="width:100px; "/>
	</xsl:template>
	<!-- end  'radio selector' templates-->
	
<xsl:template match="/frame">
	<xsl:choose>
		<xsl:when test="type='descr'">
			<body style="overflow:hidden;">
				<table id="bot-bot">
					<tr>				
						<td id="divider">
							<img class="to-max" id="maximum" src="../../../img/front/to-max.gif" alt="[]" onclick="bot2top();" />
							<img class="to-minimax" id="medium" src="../../../img/front/to-minimax.gif" alt="=" onclick="bt2mid();" style="display:none;" />
							<img class="to-min" id="minimum" src="../../../img/front/to-min.gif" alt="_" onclick="top2bot();" />

							<xsl:if test="current-system-title!= 'hidden' or not(current-system-title)">
								<div id="fzag">
									<xsl:value-of select="current-system-title"/>
								</div>
							</xsl:if>

						</td>
					</tr>
					<tr>
						<td id="content">
							<div class="scrollerx" id="zzk">
								<xsl:apply-templates select="content" />
							</div>
						</td>
					</tr>
				</table>
			</body>
		</xsl:when>
		<xsl:otherwise>
			<body style="overflow-x:hidden;display:block;">
				<table id="top-top">
					<tr>
						<td id="tabbox">
							<img class="to-max" id="maximum" src="../../../img/front/to-max.gif" alt="[]" onclick="top2bot();" />
							<img class="to-minimax" id="medium" src="../../../img/front/to-minimax.gif" alt="=" onclick="bt2mid();" style="display:none;" />
							<img class="to-min" id="minimum" src="../../../img/front/to-min.gif" alt="_" onclick="bot2top();" />
							<div id="fzag"></div>
							<ul id="tabs">
							<xsl:if test="tabs/model != 'hidden' or not(tabs/model)">
								<li id="model">
									<xsl:if test="type='model'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="model.xml" target="top-f">Модель</a>
								</li>
							</xsl:if>
							<xsl:if test="tabs/scheme != 'hidden' or not(tabs/scheme)">
								<li id="scheme">
									<xsl:if test="type='scheme'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="scheme.xml" target="top-f">Схема</a>
								</li>
							</xsl:if>
							<xsl:if test="tabs/photo != 'hidden' or not(tabs/photo)">
								<li id="photo">
									<xsl:if test="type='photo'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="photo.xml" target="top-f">Фото</a>
								</li>
							</xsl:if>
							<xsl:if test="tabs/video != 'hidden' or not(tabs/video)">
								<li id="video">
									<xsl:if test="type='video'">
										<xsl:attribute name="class">
											<xsl:text>current</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<a href="video.xml" target="top-f">Видеокадры</a>
								</li>
							</xsl:if>
							</ul>
							
							<xsl:if test="current-system-title!= 'hidden' or not(current-system-title)">
								<div id="current-system-title">
									<xsl:value-of select="current-system-title"/>
								</div>
							</xsl:if>
							
							
						</td>
					</tr>
					<tr>
						<td id="content">
							<div class="scroller">
								<xsl:apply-templates select="content" />
							</div>
						</td>
					</tr>
				</table>
			</body>
		</xsl:otherwise>
	</xsl:choose>	
</xsl:template>

<xsl:template match="/singleton">
		<body style="overflow-x:hidden;">
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
		<a class="sh-title">
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
		<object type="application/x-shockwave-flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="100%" height="100%" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0">
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
			<embed quality="high" width="100%" height="100%" wmode="transparent" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
				<xsl:attribute name="src">
					<xsl:value-of select="text()" />
				</xsl:attribute>
			</embed>
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

<xsl:template match="pdf">
	<object type="application/pdf" width="100%" height="100%">
		<xsl:attribute name="data">
			<xsl:value-of select="text()"/>
		</xsl:attribute>
	</object>
</xsl:template>
</xsl:stylesheet>