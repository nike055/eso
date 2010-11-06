<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://www.stylusstudio.com/xquery">
    <xsl:template match="/">
        <html>
            <head>
				<link rel="stylesheet" type="text/css" href="css/leftside.css" />
				<script language="javascript" src="js/leftside.js"/>
				<script language="javascript" src="js/jquery-1.4.3.js"/>
			</head>
            <body>
                <div>
                    <div class="div_current_item" id="12321">
                        <div style="text-align: none;" class="first_div">
                            
                                <xsl:for-each select="/menu/item">
                                    <xsl:variable name="item2" select="."/>
	                                    <div style="text-align: none;" class="header1" onclick="javascript:expandOrCollapse('1', id);" id="{generate-id()}">
											<table>
												<tr>
													<td>
													<img src="img/leftmenu/lmenu-off-m.gif" align="absmiddle"  class="header1"/>
													</td>
													
													<td class="header1">
														<xsl:value-of select="title"/>
													</td>
												</tr>
											</table>
											<div id="2" style="display: none">
												<xsl:value-of select="name"/>
											</div>
										</div>
										<div class="header1_list" id="{generate-id()}">		
                                            
                                                <div style="text-align: none;" class="header22">
                                                    
                                                        <xsl:for-each select="childs/item">
                                                            <xsl:variable name="item3" select="."/>
                                                            
                                                                <div class="header2" onclick="javascript:expandOrCollapse('2',id);" id="{generate-id()}">
                                                                    &#xA0;<xsl:value-of select="title"/>
																</div>
																<div id="{generate-id()}" style="display: none">
																	<xsl:value-of select="../../name"/>/<xsl:value-of select="name"/>
																</div>
																<div class="header2_list" id="{generate-id()}">
                                                                    
                                                                        <div style="text-align: none;" id="{generate-id()}">
                                                                            
                                                                                <xsl:for-each select="childs/item">
                                                                                    <xsl:variable name="item4" select="."/>
                                                                                        <div style="text-align: none;" class="header3" id="{generate-id()}" onclick="javascript:expandOrCollapse('3',id);">
                                                                                            <xsl:value-of select="title"/>
                                                                                        </div>
																						<div id="{generate-id()}" style="display: none">
																							<xsl:value-of select="../../../../name"/>/<xsl:value-of select="../../name"/>/<xsl:value-of select="name"/>
																						</div>
																						<div class="header3_list" id="{generate-id()}">
																							<div style="text-align: none;" id="{generate-id()}">
																								<xsl:for-each select="childs/item">
																									<xsl:variable name="item5" select="."/>
																										<div style="text-align: none;" class="header4" id="{generate-id()}" onclick="javascript:openURLById(id)">
																											<xsl:value-of select="title"/>
																										</div>
																										<div id="{generate-id()}" style="display: none" >
																											<xsl:value-of select="../../../../../../name"/><xsl:value-of select="../../../../../name"/>/<xsl:value-of select="../../../../name"/>/<xsl:value-of select="../../name"/>/<xsl:value-of select="name"/>
																										</div>																
																								</xsl:for-each>
																							</div>
																						</div>																						
                                                                                </xsl:for-each>
                                                                            
                                                                        </div>
                                                                    
                                                                </div>
                                                            
                                                        </xsl:for-each>
                                                    
                                                </div>
                                            
											
                                        </div>
                                    
                                </xsl:for-each>
                            
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>