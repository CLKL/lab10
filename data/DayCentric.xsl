<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : DayCentric.xsl
    Created on : April 5, 2016, 10:34 AM
    Author     : Owner
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Schedule for ACIT 4A</title>
            </head>
            <body>
                <h2>Day centric data</h2>
                <xsl:call-template name="container"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="container">
        <h1>Day of Classes</h1>
        <table>
            <tr>
                <td>
                    <xsl:call-template name="startDay"/>
                </td>
                <td>
                    <xsl:call-template name="instructors"/>
                </td>
                <td>
                    <xsl:call-template name="rooms"/>
                </td>

            </tr>
            
        </table>
    </xsl:template>
    
    <xsl:template name="startDay">
        <table>
            <tr>
                <th>Day</th>
                <th>Time</th>
                <th>Course</th>
            </tr>
            
            <xsl:for-each select="/schedule/weekday[@day='Thursday']/booking">
                <xsl:call-template name="start_day"/>

            </xsl:for-each>
            
        </table>
    </xsl:template>
    

    <xsl:template name="start_day">
        <tr>
            <td>
                <xsl:value-of select="Thursday"/>
            </td>
            <td>
                <xsl:value-of select="@time"/>   
            </td>
            <td>
                <xsl:value-of select="@cn"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template name="instructors">
        <table>
            <tr>
                <th>Instructor</th>
            </tr>

            <xsl:for-each select="/schedule/weekday[@day='Thursday']/booking/location">
                <xsl:call-template name="instructor"/>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template name="instructor">
        <tr>
            <td>
                <xsl:value-of select="@instructor"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template name="rooms">
        <table>
            <tr>
                <th>Room</th>>
            </tr>

            <xsl:for-each select="/schedule/weekday[@day='Thursday']/booking/location">
                <xsl:call-template name="room"/>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template name="room">
        <tr>
            <td>
                <xsl:value-of select="@room"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
