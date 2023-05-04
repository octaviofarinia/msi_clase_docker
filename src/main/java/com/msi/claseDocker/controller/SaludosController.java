package com.msi.claseDocker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SaludosController {

    @GetMapping("/saludar")
    public String saludar() { return "Hola";}

}
