package javi.rubricas.rubrica;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MahController {
    @GetMapping("/wolas")
    public String getGreeting() {
        return "wolas";
    }
}
