# Navigation

- [The Internet](#the-internet)
    - [Network](#network)
    - [Models](#network-models)
    - [Protocol Data Units](#protocol-data-units-pdu)
    - [Physical Layer](#the-physical-layer)
    - [Data Link Layer](#ethernet)
    - [Network Layer](#the-network-layer)
- [Transport Layer](#the-transport-layer)
    - [Communication](#communication-between-processes)
    - [TCP](#tcp-transmission-control-protocol)
    - [UDP](#udp-user-datagram-protocol)
- [HTTP](#http)
    - [Application Layer](#the-application-layer)
    - [World Wide Web](#the-world-wide-web)
    - [URL Parts](#url-parts)
    - [Query String Parts](#query-string-parts)
    - [Encoding](#encoding)
    - [Requests](#requests)
    - [Responses](#responses)
    - [Headers](#headers)
    - [Stateful Web Applications](#stateful-web-applications)
    - [Security](#security)
- [Tranport Layer Security](#transport-layer-security-tls)
    - [Encryption](#encryption)
    - [Authentication](#authentication)
    - [Integrity](#integrity)
- [Great Resources](#great-resources)

# The Internet

- The *Internet* is a vast interconnected network of networks, linking hosts from all over the globe using a series of network devices and allowing the exchange of information through the implementation of standardized protocols. Data is exchanged via network devices, such as switches and routers, relaying infomation through various requests and responses from the hosts. 

## Network
https://launchschool.com/lessons/4af196b9/assignments/268243e5

- "At the most basic level, it's two devices connected in such a way that they can communicate or exchange data."

- A network, in its simplest form, is formed when two devices are connected, allowing communication and data to be exchanged between them.

### Local Area Network (LAN)
https://launchschool.com/lessons/4af196b9/assignments/268243e5

- "...multiple computers and other devices connected via a network bridging device such as a hub or, more likely, a switch. The computers are all connected to this device via network cables, and this forms the network."

- A Local Area Network (LAN) is established between multiple devices that have a tangibly physical source connecting them, typically within a close proximity. These devices are connected by networks cables that are grouped together using hubs, bridges, or switches.

### Wireless Local Area Network (WLAN)

- Similarly to a LAN, a Wireless Local Area Network is established between mutliple nearby devices; however, these devices are instead connected through radio waves, creating a wireless connection between devices. While WLAN allows for greater device transportability, it comes at the cost of slower latency and smaller bandwidth.

### Router

- "Routers are network devices that can route network traffic to other networks. Within a Local Area Network, they effectively act as gateways into and out of the network."

- Networks are linked together by the implementation of **routers**, which route data enchange from network to network.

### Protocol

- "In simple terms, we can think of a protocol as a *system of rules*."
- "In terms of computer networks, we can be a bit more specific: A set of rules that govern the exchange or transmission of data."

- A *protocol* is a system of rules that two hosts follow to allow for successful data exchange or transmission. Without these agreed-upon rules, information between the hosts would become chaotic and likely misunderstood and unprotected.

Why so many protocols?

1. "Different protocols were developed to address different aspects of network communication."
2. "Different protocols were developed to address the same aspect of network communication but differently for a specific use case."

## Network Models
https://launchschool.com/lessons/4af196b9/assignments/21ef33af

- "Although there is utility in both of these approaches, no single model will perfectly fit a real-world implementation."

### OSI Model

Wikipedia: https://en.wikipedia.org/wiki/OSI_model

- "The Open Systems Interconnection model (OSI model) is a reference model from the International Organization for Standardization (ISO) that "provides a common basis for the coordination of standards development for the purpose of systems interconnection."

- Layer 7: Application
- Layer 6: Presentation
- Layer 5: Session   
- Layer 4: Transport (Service to Service)
- Layer 3: Network (End to End)
- Layer 2: Data Link (Hop to Hop)
- Layer 1: Physical (Transporting Bits)

### Internet Protocol Suite (TCP/IP) Model

- Layer 4: Application (5-7)
- Layer 3: Transport (4)
- Layer 2: Network (3)
- Layer 1: Network Interface (1-2)

## Protocol Data Units (PDU)
https://launchschool.com/lessons/4af196b9/assignments/21ef33af

"...a Protocol Data Unit (PDU) is an amount or block of data transferred over a network. Different protocols or protocol layers refer to PDUs by different names. At the Link/ Data Link layer, for example, a PDU is known as a frame. At the Internet/ Network layer it is known as a packet. At the Transport layer, it is known as a segment (TCP) or datagram (UDP)."

- A protocol data unit (**PDU**) represents a block of data that is transferred across a network, with each PDU receiving a different name depending on its placement within the OSI or TCP/IP model.

Specific Layer PDUs:

- Transfer - *segments* (TCP) *datagrams* (UDP)
- Network - *packets*
- Data Link - *frames* (Ethernet frames)

### Encapsulation of Data

- The entire PDU for a specific layer of a network model--header, data payload, trailer--is encapsulated as the data payload for the layer below it. For example, the TCP segment of a data exchange is encapsulated within the data payload of the IP packet, which is then encapsulated as the data payload of the ethernet frame. This allows each layer to operate independently, disregarding any information from other layers and providing a 'service' to the upward layer.

Quiz Answers:

- "Encapsulation is implemented through the use of Protocol Data Units (PDUs)."
- "Encapsulation creates separation between protocols operating at different networks layers."
- "With encapsulation, the entire PDU from one layer forms the data payload for the PDU at the layer below."

### Header/Trailer

"The exact structure of the header and, if included, trailer varies from protocol to protocol, but the purpose of them is the same in each case: to provide protocol-specific metadata about the PDU."

## The Physical Layer

### Wires, Cables, and WiFi (Khan Academy)
https://www.khanacademy.org/computing/code-org/computers-and-the-internet/internet-works/v/the-internet-wires-cables-and-wifi

### Bit
Khan Academy
"A bit can be described as any pair of opposites: on or off, yes or no. We typically use a 1 (on) or a 0 (off)"
"These are the atoms of information."
"Today, we physically send bits by electricity, lights, and radio waves."

### Bandwidth

- "Bandwidth is the amount of data that can be sent in a particular unit of time (typically, a second)."

- **Bandwidth** refers to the total data that can be transferred from one device to another within a specific timeframe.

### Bit Rate

"The number of bits that we can send over a given period of time, usually measured in seconds."

### Latency

- "...latency is a measure of the time it takes for some data to get from one point in a network to another point in a network."
- "We can think of latency as a measure of delay."

- **Latency** is the measure of time that it takes for data to move from one part of a network to another.

Different types of delay:

- Propagation delay
- Transmission delay
- Processing delay
- Queing delay
- Last-mile latency
- Round-trip Time (RTT)

### Methods of Transportation

1. Electricity (Copper wires)

- Cheap
- Signal loss

2. Fiber Optic Cable

"A thread of glass engineered to reflect light."
- Really fast
- No signal loss
- Expensive

3. Radio Waves

"Uses radio signal to send bits from one place to another."
- Translates 1's and 0's from binary to radio waves and back.
- Totally mobile
- Short range

### Fault Tolerant

- Because a package can take a variety of routes from one IP address to another, the system is fault tolerant, as a distruption in one path can be avoiding by following another path.

### Hop

- A **hop** is the movement from one device to another. Each IP package keeps track of its hop count, preventing bugs in the path from halting a delivery using the hop limit.

## Ethernet
https://launchschool.com/lessons/4af196b9/assignments/81df3782

- "An Ethernet Frame adds logical structure to this binary data."
- "Two of the most important aspects of Ethernet are framing and addressing."

## MAC Address
https://launchschool.com/lessons/4af196b9/assignments/81df3782

- Media Access Control address

- "Since this address is linked to the specific physical device, and (usually) doesn't change, it is sometimes referred to as the physical address or burned-in address. MAC Addresses are formatted as a sequence of six two-digit hexadecimal numbers, e.g. 00:40:96:9d:68:0a, with different ranges of addresses being assigned to different network hardware manufacturers."

- The Media Access Control (**MAC**) address is an address, formatted as a sequence of six two-digit hexadecimal numbers, that is linked to the Network Interface Card (NIC) of a specific physical device and typically never changes. While useful in the exchange of Ethernet frames between adjacent devices, MAC addresses do not scale well, as they are non-hiarchical and illogical in nature.

## The Network Layer

### Internet Protocol (IP) address
https://launchschool.com/lessons/4af196b9/assignments/b222ecfb

- "This means that they are not tied to a specific device, but can be assigned as required to devices as they join a network."
- "When an IP packet is received by a router, the router examines the destination IP address and matches it against a list of network addresses in its routing table."
- "The Protocol Data Unit (PDU) within the IP Protocol is referred to as a packet."
- "Within both models, the primary function of protocols at this layer is to facilitate communication between hosts (e.g. computers) on different networks."

- An Internet Protocol (IP) address is a 32-bit identifier, broken into a series of 4 integers, that is dynamically assigned to a device on a network. The range in which an IP address is assigned is based upon a network hierarchy, splitting each part of the network into logical sub-networks.

# The Transport Layer

## Communication Between Processes
https://launchschool.com/lessons/2a6c7439/assignments/41113e98

### Multiplexing

- "In the context of a communication network, this idea of transmitting multiple signals over a single channel is known as multiplexing, with demultiplexing being the reverse process."

- **Multiplexing** occurs when multiple signals are transmitted over a single channel. 

### Port

- "In simple terms a port is an identifier for a specific process running on a host. This identifier is an integer in the range 0-65535."
- "Ports are used in the process of multiplexing and demultiplexing."

- A **port number** is an integer identifier between 0-65535 that reference a specific application or process existing within a host.
- The source and destination port numbers can be seen in the Transport layer PDUs.

### Socket

- Combination of the IP address and port number
- During implementation, a socket can be instantiated as a socket object.
- "A socket is a communication end-point."
- A socket is used to establish connection between applications.

## TCP (Transmission Control Protocol)
https://launchschool.com/lessons/2a6c7439/assignments/d09ddd52

- The Transmission Control Protocol (TCP) allows for reliable transfer between the client and server, implementing a three-way handshake design to ensure all packets of information make it from one to the other.

- Transmission Control Protocol (**TCP**) is a connection-oriented protocol focused primarily on reliable data exchange, implementing services to ensure that all data arrives in tact, in order, and without duplication.

### Included

- Connection-oriented protocol
- Multiplexing/Demultiplexing
- In-order delivery
- De-duplication
- Message acknowledgements and retransmission
- Error detection (checksum)

### Three-way Handshake

- A three-way handshake is used within TCP to establish a working connection between two applications. The client will first send a message with the SYN flag raised, to which the server will respond with a raised SYN-ACK flag raised. Once received, the client will send a second message with the ACK flag raised, and once this is received by the server, communication can commence.

### Flow Control

- "Flow Control is a mechanism to prevent the sender overwhelming the receiver with more data than it can process. Each participant in a connection lets the other participant know how much data it is willing to accept using a field in the TCP header."

- To prevent overwhelming the receiver with too much data from the sender, TCP implements **flow control**. By establishing each network's *window size*, the segment can dynamically control how much data is being sent at one time to prevent clutter which could result in dropped data.

- Window size is sent with each segment, allowing adjustments to be made as needed.

### Congestion Avoidance

- "Congestion avoidance is a process by which TCP uses data loss (based on the volume of retransmissions required) as a feedback mechanism to determine how congested the network is, and adjusts the amount of data being sent accordingly."

- To prevent overwhelming the network with too much data from the sender, TCP implements **congestion avoidance**. By analyzing the Round-Trip Time (RTT) and absence of an ACK (dropped packet), the segment will reduce the size of its *transmission window*, limiting the total unacknowledged segments that the sender can transmit at a given time.

- Determined by RTT, absence of acknowledged segments, and others

## UDP (User Datagram Protocol)
https://launchschool.com/lessons/2a6c7439/assignments/9bb82c9b

- "The Protocol Data Unit (PDU) of UDP is known as a Datagram."
- "This simplicity provides two things to a software engineer: speed and flexibility."

- The User Datagram Protocol (**UDP**) is a connectionless protocol focused primarily on speed and flexibility at the cost of reliability. While a basic checksum algorithm is utilized, no additional services are implemented that check the data exchanged; that said, its flexibility allows developers to add specific services without including the full TCP package.

### Included:

- Connectionless protocol
- Multiplexing/Demultiplexing
- Error detection (checksum)

### What it doesn't do:

- "It provides no guarantee of message delivery"
- "It provides no guarantee of message delivery order"
- "It provides no built-in congestion avoidance or flow-control mechanisms"
- "It provides no connection state tracking, since it is a connectionless protocol"

# HTTP
https://launchschool.com/books/http/read/background

- "Hypertext Transfer Protocol (HTTP) is the set of rules which provide uniformity to the way resources on the web are transferred between applications."

- HTTP is a text-based request response protocol that allows the transfer of hypertext documents between two web applications. This is accomplished through requests, which can retrieve, add, or change various documents by means of HTTP methods, and the subsequent response, which provides information about the documents and status code of the request.

## The Application Layer
https://launchschool.com/lessons/cc97deb5/assignments/c604eb60

- "We can perhaps think of Application layer protocols as being the rules for how applications talk to each other at a syntactical level."

- The Application layer's job in regards to the OSI model allows applications to share information at a syntactical level. Certain applications, such as e-mail clients or web browser, require different kinds of communcation, which is where the Application layer protocols come to shine.

## The World Wide Web
https://launchschool.com/lessons/cc97deb5/assignments/e3d85587

- "The World Wide Web, or web for short, is a **service** that can be accessed via the internet. In simple terms it is a vast information system comprised of resources which are navigable by means of a URL (Uniform Resource Locator)."

- The World Wide Web is a **service** used to engage with the internet, encompassing a vast system of information that can be navigated via a URL.

### HTML

- "Hypertext Markup Language (HTML) was the means by which the resources in this system should be uniformly structured."

- Hypertext Markup Language (**HTML**) is a plain-text file that describes both structure and layout of a web page, forming the foundation of the World Wide Web.

### URN

- A Uniform Resource Locator is a type of URI that uses the specific naming scheme of urn
    - urn:isbn:0-486-27557-4
    - urn:isbn:0-395-36341-1

### URL

- A URL is a type of URI that includes *both* the name and protocol. While its technically correct to call a string of characters with both present a URI, it's *more correct* to refer to it as a URL, as its a more specific distinction.

### URI

- "A Uniform Resource Identifier (URI), is a string of characters which identifies a particular resource."

- A URI is a string of characters that identifies a specific resource and can include either its name, protocol, or both.

### Difference between a URI and URL

- A URI is a string of characters that identifies a specific resource and can include either its name, protocol, or both. A URL is a type of URI that includes *both* the name and protocol. While its technically correct to call a string of characters with both present a URI, it's *more correct* to refer to it as a URL, as its a more specific distinction.

- URI => Identifier
- URN => Name/Number
- URL => Name/Number + Protocol

### Resource

- ""Resource" is a generic term for things you interact with on the Internet via a URL. This includes images, videos, web pages and other files."

### Web Browser

- The client that is typically used by the user to request data throughout the internet is the **web browser**.

### Domain Name System

- The **Domain Name System (DNS)** is a distributed database of addresses that reference specific IP addresses throughout the internet, using more readable names such as `www.google.com` to identify its respective IP address.

## URL Parts

`https://www.google.com:80/search?q=toys#small`

### Scheme

`https`

- The **scheme** instructs the web client on how to access the resource. While there is a connection between the scheme and a protocol, they are *not* the same thing; the scheme simply indicates which protocol is being used.

### Host

`www.google.com`

- The **host** instructs the web client on where the resource is hosted.

### Port Number

`:80`

- The **port number** dictates which specific port is used. If none are indicated, then the port defaults to `80` for HTTP and `443` for HTTPS.

### Path

`/search`

- The **path** dictates which local resource is being requested within the host.

### Query String

`?q=toys`

- The **query string**, which is made up of one or more *query parameters* are used to send additional data to the server upon request.

### Fragment

`#small`

- The **fragment** is an internal page reference.

## Query String Parts

`http://www.phoneshop.com?product=iphone&size=32gb&color=white`

Query String => `?product=iphone&size=32gb&color=white`

### Parameters

`product=iphone` / `size=32gb` / `color=white`

- A parameter is notated by its *name* and *value*.
- Each parameter is separated by `&`.
- Because certain special characters cannot be used in the query string, a UTF-8 code will be used to represent them. A space, for example, uses `%20`, such as `launch%20school`.

## Encoding

- Because URLs are designed to only accept specific characters within the standard ASCII character set, some characters that are desired to be used in the URL must be encoded. This is achieved using the `%` symbol, followed by two hexadecimal digits, converting something like `%20` into a `' '` character.

Reasons for encoding:

1. The character is not included in the standard ASCII character set.
2. The character is "unsafe" as it may be misinterpreted or modified in specific situations.
3. The character is used in a standard URL scheme.

## Requests
https://launchschool.com/books/http/read/making_requests

- Any time that you enter a URL or click on a resource, your web browser (client) is making a request to its respective server.

### HTTP Tool

- An HTTP tool can be used to *inspect* the raw response received from a server at the client's request. Specific tools, such as the **inspector**, will organize the raw data into more readable information, showcasing data such as the raw file data, its, type and size, the request method, status code, and much more.

### Methods

- "You can think of this as the verb that tells the server what action to perform on a resource."

- An HTTP request method indicates what kind of request is being called, with the two most common being `GET` which retrieves data and `POST` which adds data.

### GET

Primary concepts:

- "GET requests are used to retrieve a resource, and most links are GETs."
- "The response from a GET request can be anything, but if it's HTML and that HTML references other resources, your browser will automatically request those referenced resources. A pure HTTP tool will not."

### POST

- "POST requests allow us to send much larger and sensitive data to the server, such as images or videos."
- "POST requests also help sidestep the query string size limitation that you have with GET requests."

### Body

- "The body contains the data that is being transmitted in an HTTP message and is optional."

## Responses

- The raw data that is returned by a server from a request is the **response**.

### Status Code

- The **status code** is a three-digit number included in the HTTP response that references the status of the given request.

Ranges:

- 1xx = Informational
- 2xx = Successful
- 3xx = Redirection
- 4xx = Client Error
- 5xx = Server Error

Typical status codes:

- 200 = OK
- 302 = Found (but in a different spot)
- 404 = Not Found
- 500 = Internal Server Error

## Headers

### Request Headers

1. Host
- Domain name of server
- `Host:www.reddit.com`

2. Accept-Language
- Acceptable languages that can be used
- `Accept-Language: en-US, en;q=0.8`

3. User-Agent
- A string that IDs the client
- `User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.101 Safari/537.36`

4. Connection
- Type of connection client prefers
- `Connection: keep-alive`

### Response Headers

1. Content-Encoding
- Type of data encoding
- `Content-Encoding: gzip`

2. Server
- Name of server
- `Server: thin 1.5.0 codename Knife`

3. Location
- New resource location
- `Location: https://www.github.com/login`

4. Content-Type
- Type of data
- `Content-Type:text/html; charset=UTF-8`

## Statelessness Protocol

- A stateless protocol is designed in a way that each request/response pair is completely independent of the previous one

## Stateful Web Applications
https://launchschool.com/books/http/read/statefulness

- HTTP is a *stateless* protocol in that it does not persist state in any part of its implementation, causing each request and response by applications to act independently from others. This provides resilience to the HTTP protocol, as no maintenance is required throughout usage; however, lack of state creates a challenging experience for building stateful applications as programmers must find alternative methods of storing information.

### Sessions

- A web browser may receive a **session identifier** (token) as part of their request that allows each request to include the appended token, creating a sense of statefulness to the session. It's important to note that, although state seems to exist through the implementation of the token, each request is still independent from others.

- Maintaining faux statefulness connection are
    - Every request must be inspected for a session identifier
    - If the request contain a session id, the server must check to ensure the session id is still valid (Server have rules regarding how to handle session expiration and how to store its session data)
    - The server needs to recreate the application state

### Cookies

- "Cookies or HTTP cookies, are small files stored in the browser and contain the session information."

- **Cookies** are files that are stored on a web browser that contain specific session information, allowing these files to be included in each HTTP request and thus imitating a stateful environment.

### Asynchronous JavaScript and XML (AJAX)

-"Its main feature is that it allows browsers to issue requests and process responses without a full page refresh."

- Used to request data and process its response without reloading the current web page.

## Security
https://launchschool.com/books/http/read/security

### HTTPS

- Hypertext Transfer Protocol Secure (HTTPS) is an extension of the HTTP protocol that adds additional security by encrypting data between every exchange, providing only the client and server the key to decrypt it. This is accomplished through the use of certificates to exchange security keys with the two parties before encryption begins.

### Same-Origin Policy

- "The same-origin policy permits unrestricted interaction between resources originating from the same origin, but restricts certain interactions between resources originating from different origins."

- The **same-origin policy** restricts specific interactions between foreign resources, referring to those that originate from a different scheme or host. While more secure, this restriction can make it challenging for developers who require cross-origin requests. To combat this, Cross-origin resource sharing (**CORS**) was developed to permit these cross-origin interactions by implementing a new set of HTTP headers.

### Session Hijacking

- "Unfortunately, if an attacker gets a hold of the session id, both the attacker and the user now share the same session and both can access the web application. In session hijacking, the user won't even know an attacker is accessing his or her session without ever even knowing the username or password."

- If a hijacker gets a hold of a client's session ID token, they will have full access to their session without the need of a correct username or password. Developers can implement methods of preventing full access from this token by frequently resetting sessions, setting expiration times on sessions, or by implementing HTTPS to encypt all data, including the session ID.

### Cross-Site Scripting (XSS)

- "This type of attack happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly."

- When given the ability to add additional content to a site, such as comment blocks, users can input explicit HTML or JavaScript code which may alter the host in an unintended way. To prevent such a breach, developers are encouraged to sanitize any input from users, eliminating specific problematic input, or *escape* their input when displaying it to the console.

# Server-side
    - Web server is a server that responds to requests for static assets : files, images, css, javascript, etc. These request don't require any data processing
    - Application server is where application or logic resides. This is where complicated request are handled. This is where server-side code lives when deployed
    - Data store is where application server retrieve or create data such as : simple files, key/value stores, document stores.


# Transport Layer Security (TLS)
 

- The Transport Layer Security (TLS) protocol is used throughout the HTTPS request/response cycle to add its extra layer of security. This is achieved through the *encryption* of data using a cipher, *authorization* verified by a Certificate Authority, and *integrity* maintained by way of the Message Authorization Code.

## Encryption
https://launchschool.com/lessons/74f1325b/assignments/54f6defc

- "...a process of encoding a message so that it can only be read by those with an authorized means of decoding the message."

### TLS Handshake

TLS Process is used to:

- "Agree which version of TLS to be used in establishing a secure connection."
- "Agree on the various algorithms that will be included in the cipher suite."
- "Enable the exchange of symmetric keys that will be used for message encryption."

Steps:

1. 
- ClientHello
    - Max version of TLS supported by client
    - Client's cipher suite
2. 
- ServerHello
    - Max version of TLS supported by server
    - Selected cipher
- Certificate
    - Certificate chain
    - Public key
- ServerHelloDone
    - Nothing else to send
3. 
- ClientKeyExchange
    - Sends Pre Master Secret
- ChangeCipherSpec
    - Signifies that client is ready to communicate with cipher
- Finished
    - Encrypted Verification
4. 
- ChangeCipherSpec
    - Signifies that server is ready to communicate with cipher
- Finished
    - Encrypted Verification

### Cipher

- "A cipher is a cryptographic algorithm; in other words they are sets of steps for performing encryption, decryption, and other related tasks. A cipher suite is a suite, or set, of ciphers."

- A cipher is an algorithmic key used to decrypt encoded messages.

## Authentication
https://launchschool.com/lessons/74f1325b/assignments/95e698ab

- "...a process to verify the identity of a particular party in the message exchange."

### Certificate Authority (CA)

- "If you are presented with a piece of identification, you are much more likely to accept it as genuine if it has been issued by a trustworthy source. When it comes to digital certificates, the trustworthy sources are called Certificate Authorities (CAs)."

- A Certificate Authority (CA) is a trusted authority that issues a certificate to an IP to prove that they are who they claim to be. While not 100% guaranteed, CAs work through a *Chain of Trust*, a reputation built on longevity and prominence, that ensure a client is entrusting their data with the appropriate server.

## Integrity
https://launchschool.com/lessons/74f1325b/assignments/a88271cf

- "...a process to detect whether a message has been interfered with or faked."

### TLS Encapsulation

- "The OSI model defines TLS as a Session layer protocol, and so existing in between Application layer (where HTTP resides) and the Transport layer (where TCP resides)."

### Message Authentication Code (MAC)

- This is different from MAC Address ( Message Authentication Code)

- "The intention of the MAC field in a TLS record is to add a layer of security by providing a means of checking that the message hasn't been altered or tampered with in transit."

- The Message Authentication Code (MAC) is used as part of the TLS record to check whether the data has been altered while in transit.

### TLS Summary

HTTP Requests and Responses are transferred in plain text; as such they are essentially insecure.

We can use the Transport Layer Security (TLS) Protocol to add security to HTTP communications.

TLS encryption allows us to encode messages so that they can only be read by those with an authorized means of decoding the message

TLS encryption uses a combination of Symmetric Key Encryption and Asymmetric Key Encryption. Encryption of the initial key exchange is performed asymmetrically, and subsequent communications are symmetrically encrypted.

The TLS Handshake is the process by which a client and a server exchange encryption keys.

The TLS Handshake must be performed before secure data exchange can begin; it involves several round-trips of latency and therefore has an impact on performance.

A cipher suite is the agreed set of algorithms used by the client and server during the secure message exchange.

TLS authentication is a means of verifying the identity of a participant in a message exchange.

TLS Authentication is implemented through the use of Digital Certificates.

Certificates are signed by a Certificate Authority, and work on the basis of a Chain of Trust which leads to one of a small group of highly trusted Root CAs.

The server's certificate is sent during the TLS Handshake process.

TLS Integrity provides a means of checking whether a message has been altered or interfered with in transit.

TLS Integrity is implemented through the use of a Message Authentication Code (MAC).

# Great Resources

1. HTTP Fundamentals (Great defintions of HTTP/protocol)
- https://www.youtube.com/watch?v=qv5-5hhsKpE

2. TLS Handshake (Extremely detailed, matches LS)
- https://www.youtube.com/watch?v=ZkL10eoG1PY&t=1158s

3. How does the Internet Work (Super fun read)
https://jsinibardy.com/how-internet-works

