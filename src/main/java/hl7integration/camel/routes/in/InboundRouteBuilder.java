package hl7integration.camel.routes.in;

import org.apache.camel.spring.SpringRouteBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class InboundRouteBuilder extends SpringRouteBuilder {
    private static final Logger log = LoggerFactory.getLogger(InboundRouteBuilder.class);

    @Override
    public void configure() throws Exception {

        from("mllpport").routeId("Validator-Camel-Route")
                .to("bean:processor?method=processMessage")
                .to("bean:respondACK?method=process")
                .end();
    }
}
