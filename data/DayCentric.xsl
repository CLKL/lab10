<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--
        Document   : TimeCentric.xsl
        Created on : April 1, 2016, 9:12 PM
        Author     : Kelly
        Description:
            Purpose of transformation follows.
    -->

    <xsl:output method="html"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <!-- setting up html sheet and table -->
        <html>
            <head>
                <title>Schedule for ACIT 4A</title>
            </head>
            <body>
                <h2>Day-centric Schedule</h2>
                <table>
                    <xsl:call-template name="heading"/>
                    <xsl:apply-templates select="schedule/period"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="heading">
        <tr>
            <th>Time\Day</th>
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
        </tr>
    </xsl:template>

    <xsl:template match="period">    
        <tr>
            <td>
                <xsl:value-of select="@time"/>
            </td>
            <td>
                <xsl:apply-templates select= "booking[@day='Monday']"/>
            </td>
            <td>
                <xsl:apply-templates select= "booking[@day='Tuesday']"/>
            </td>
            <td>
                <xsl:apply-templates select= "booking[@day='Wednesday']"/>
            </td>
            <td>
                <xsl:apply-templates select= "booking[@day='Thursday']"/>
            </td>
            <td>
                <xsl:apply-templates select= "booking[@day='Friday']"/>
            </td>
        </tr>
           
        
    </xsl:template>

    <xsl:template match="booking">      
        <xsl:value-of select="location/@room"/>
        <br />
        <xsl:value-of select="location/@instructor"/>
        <br />
        <xsl:value-of select="@cn"/>
     
    </xsl:template>
</xsl:stylesheet>