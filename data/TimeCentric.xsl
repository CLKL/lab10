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
                <h2>Time centric schedule</h2>
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


            </tr>

        </table>
    </xsl:template>

    <xsl:template name="startDay">
        <table>
            <tr>
                <th>
                    Day/Time
                </th>
                <xsl:for-each select="/schedule/weekday/booking">
                    <xsl:call-template name="top"/>

                </xsl:for-each>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="/schedule/weekday/@day"/>
                </td>

                <xsl:call-template name="instructors"/>


            </tr>

            <tr>
                <td>
                </td>
                <xsl:call-template name="rooms"/>


            </tr>
        </table>
    </xsl:template>

    <xsl:template name="top">

        <th>
            <xsl:value-of select="@time"/>   
        </th>


    </xsl:template>




    <xsl:template name="instructor">

        <td>
            <xsl:value-of select="@instructor"/>
            <br />
            <xsl:value-of select="../@cn"/>
        </td>
    </xsl:template>



    <xsl:template name="room">

        <td>
            <xsl:value-of select="@room"/>
        </td>

    </xsl:template>
    <xsl:template name="instructors">


        <xsl:for-each select="/schedule/weekday/booking/location">
            <xsl:call-template name="instructor"/>

        </xsl:for-each>
    </xsl:template>
    <xsl:template name="rooms">


        <xsl:for-each select="/schedule/weekday/booking/location">
            <xsl:call-template name="room"/>

        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
