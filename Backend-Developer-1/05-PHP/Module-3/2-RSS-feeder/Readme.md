# PHP Module 3: RSS News Aggregator 

## Inhoud
- [Introduction](#introduction)
- [What Are the Benefits of Having an RSS Feed on Your Website?](#What-Are-the-Benefits-of-Having-an-RSS-Feed-on-Your-Website?)
- [How to Create an RSS Feed](#How-to-Create-an-RSS-Feed)
- [XMLWriter](#XMLWriter)
- [Assignments](#Assignments)

## Introduction
You work hard to build your audience for your website or blog. And when the ideal reader comes along — someone who fits all markers of your target audience — you don’t want to lose them.

But the problem is we’re all so bombarded with content and information from hundreds of sources every day. Your ideal reader may love what they find on your website, but forget where they found it almost immediately. And that means you’ve lost the perfect reader — the one you’ve been making all this content for in the first place!

Having an RSS feed can solve this problem. (RSS stands for really simple syndication)[https://rss.com/what-is-rss/], and it refers to a script you place on your website that your readers can subscribe to.

Once [they’ve subscribed](https://rss.com/subscribe-rss-feeds/), they’ll be notified whenever you post new content. And that means you won’t lose the perfect reader out in the neverending competing sea of information.

## What Are the Benefits of Having an RSS Feed on Your Website?
As mentioned above, an RSS feed will keep your most devoted readers coming back for more. And that’s a good thing when you’re hoping to increase traffic to your website.

When your readers add your website to their RSS feed reader, they’ll have an easy reason for clicking over to see what’s new — your latest post headlines will be right in their reader! Your traffic will increase as your readers easily return to see everything you’ve posted, and you don’t have to worry about losing audience members who are in your target market.

Similarly, an RSS feed helps keep you top of mind in your audience member’s world. Without the reminder of your website in their feed, they may forget how much they enjoyed your content.

You may be writing the perfect post with the ideal solution that they would do anything for, but if you aren’t top of mind, they won’t think of you for their solutions.

An RSS feed helps you circumnavigate the issues you face in trying to reach your audience through email newsletters.

You may have a great email list, but are your readers actually opening the emails you send? Some of your newsletters may get lost by being tagged as spam, which means some on your list may never even know you’ve tried to reach them. And don’t forget how inundated inboxes become. Some of your readers may delete your email before opening it, simply because they have too many other things to deal with in their inboxes.

[![RSS Made Easy](http://img.youtube.com/vi/6HNUqDL-pI8/0.jpg)](https://www.youtube.com/watch?v=6HNUqDL-pI8 "RSS Made Easy")

## How to Create an RSS Feed
So how do you reap these awesome benefits — increased traffic, return readers, increased visibility, and a more sure way of reaching your audience?

Well, one way involves knowing quite a bit of code. RSS feeds are created using XML code. In the first node, you declare the channel and title of the feed, links back to the website, a description of the feed, and its language. You can also include an image (like a logo) within the XML code. This part of the code remains static.

To ensure your updates from your website are added to your feed, you’ll need to create a new node. Within that node, you’ll add a new item to the top of the list each time you update, including the title of the item, the publish date, a link to the item’s webpage, and a CDATA description.

The below video lays out the steps for writing the code for your RSS feed.

[![How to make an RSS Feed](http://img.youtube.com/vi/PTXnmMlipmo/0.jpg)](https://www.youtube.com/watch?v=PTXnmMlipmo "How to make an RSS Feed")


```XML
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
    <channel>
        <!-- Website details -->
        <title>Ministrare - News Cast</title>
        <link>www.ministrare.be</link>
        <description>NewsCast</description>
        <language>nl</language>
        <!-- Image used when linking -->
        <image>
            <title>Ministrare - News Cast</title>
            <link>http://www.ministrare.be</link>
            <url>http://www.ministrare.be/image.jpg</url>
            <width>150</width>
            <height>124</height>
        </image>
        <!-- Everthing above will never change when new posts are added -->

        <!-- New posts are added as a item -->
        <item>
            <title>Ministrare - News Cast</title>
            <pubDate>Sat 3 Oct 2019 13:00</pubDate>
            <link>http://www.ministrare.be/blog/1</link>
            <description><![CDATA[Visit this <a href="www.ministrare.be">link</a> to my website!]]></description>
            
            <!-- Additonal Nodes for blogs -->
            <author>Admin@ministrare.be</author>
            <comments>http://www.ministrare.be/blog/1#comments</comments>
            
            <!-- Additonal Nodes for ITunes -->
            <category>Docker</category>
            <enclosure url="http://www.ministrare.be/podcast.mp4" length="19741854" type="video/mpeg" /><!-- Length in bites -->
        </item>

    </channel>
</rss>
```

## XMLWriter
As backend developers, we hate having to write everything out several times. After all, we are always looking for ways to make things as easy as possible for ourselves.

Of course PHP has already provided us with an object to have XML generated by PHP itself. Called [XMLWriter](https://php.net/xmlwriter).

Let's take a look at the following example:

```php
// Instantiate a XMLWriter object:
$xml = new XMLWriter();
// Next open the file to which you want to write. For example, to write to /var/www/example.com/xml/output.xml, use:
$xml->openURI('file:///var/www/example.com/xml/output.xml');
// To start the document (create the XML open tag):
$xml->startDocument('1.0', 'utf-8');
// Set Indent to 4 spaces
$xml->setIndent(4);

// Create the RSS element
$xml->startElement('rss');
    $xml->writeAttribute('version', '2.0');
        // Create the channel element
        $xml->startElement('channel');
            // Sets channel attributes
            $xml->writeElement('title', 'Ministrare - News Cast');
            $xml->writeElement('link', 'www.ministrare.be');
            $xml->writeElement('description', 'NewsCast');
            $xml->writeElement('language', 'nl');
                // Create the image element
                $xml->startElement('image');
                    // Sets image attributes
                    $xml->writeElement('title', '');
                    $xml->writeElement('link','');
                    $xml->writeElement('url','');
                    $xml->writeElement('width','');
                    $xml->writeElement('height','');
                // Closes the image element
                $xml->endElement();
                // Create the image element
                $xml->startElement('item');
                    // Sets item attributes
                    $xml->writeElement('title', '');
                    $xml->writeElement('pubDate', '');
                    $xml->writeElement('link', '');
                    $xml->writeElement('description', '');
                    $xml->writeElement('author', '');
                    $xml->writeElement('comments', '');
                    $xml->writeElement('category', '');
                    $xml->writeElement('author', '');
                        // Create the enclosure element
                        $xml->startElement('enclosure');
                            // Sets enclosure attributes
                            $xml->writeAttribute('url', 'http://www.ministrare.be/podcast.mp4');
                            $xml->writeAttribute('length', '19741854');
                            $xml->writeAttribute('type', 'video/mpeg');
                        // Closes the enclosure element
                        $xml->endElement();
                // Closes the item element
                $xml->endElement();
        // Closes the channel element
        $xml->endElement();
// Closes the RSS element
$xml->endElement();
```

## Assignments
- Create an function, which allows us to generate an XML page based on an array of items (in the example down bellow), which contains all the items data.
- Create an OOP class, which allows us to generate an XML page based on an array of items (in the example down bellow), which contains all the items data.

```php

$data = array(
    array(
        'title' => 'Website is going down, End of the world is near!',
        'pubDate' => 'Fri 9 Oct 2019 13:00',
        'link' => 'http://www.ministrare.be/blog/4',
        'description' => '<![CDATA[End of the world!]]>'
    ),
    array(
        'title' => 'Our first post is a fact!',
        'pubDate' => 'Wen 7 Oct 2019 13:00',
        'link' => 'http://www.ministrare.be/blog/3',
        'description' => '<![CDATA[Visit this <a href="http://www.ministrare.be">link</a> to my website!]]>'
    ),
    array(
        'title' => 'Our second post is alive!',
        'pubDate' => 'Mon 5 Oct 2019 13:00',
        'link' => 'http://www.ministrare.be/blog/2',
        'description' => '<![CDATA[Visit this <a href="http://www.ministrare.be">link</a> to my website!]]>'
    ),
    array(
        'title' => 'Our first post is a fact!',
        'pubDate' => 'Sat 3 Oct 2019 13:00',
        'link' => 'http://www.ministrare.be/blog/1',
        'description' => '<![CDATA[Visit this <a href="http://www.ministrare.be">link</a> to my website!]]>'
    )
);
```
