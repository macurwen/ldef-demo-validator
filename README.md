LDEF V2 Validator
==================
The Validator application consumes HL7 messages that are exposed over the TCP transport layer through the
HL7 MLLP protocol. Utilizing the power of HAPI, it verifies the validity of the HL7 messages. If a message are invalid,
such is recorded in the MongoDB log and the message parsing is skipped. If the message is valid, such is recorded and then
the message is parsed to see if it an A03 message AND that it is an ED message. If the message fails to be both, this is
recorded is MongoDB as well. All valid A03 ED messages are converted into XML and recorded in MongoDB, as well as added
to a ActiveMQ queue as HL7. This application can be configured using the endpoint.properties file under the resources directory.

endpoint.properties file
	- configuration file that allows you to update the following:
	    - endpoint.server
            - the server that the hl7 listener is being exposed to
        - endpoint.port
            - the port that the hl7 listener is being exposed to
		- mongo-ip
			- ip location for mongo log
		- activemq-uri
			- uri where activemq queue resides (activemq default ip for TCP traffic is 61616)

run command :
	hawtio:camel
        - runs the application in the background while also hosting a Hawt.io web application to view
        the active route and all of the endpoints
    camel:run
        - runs the application in the background
