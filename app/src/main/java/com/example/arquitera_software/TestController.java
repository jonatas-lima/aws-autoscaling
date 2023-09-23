package com.example.arquitera_software;

import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class TestController {

    @GetMapping("/test")
    public ResponseEntity<Void> testEndpoint() {
        System.out.println("START :: /test ENDPOINT");
        try {
            List<Thread> threads = new ArrayList<>();
            for (int i = 0; i < 10000; i++) {
                Thread t = new Thread(() -> {
                    try {
                        Thread.sleep(10000);
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        throw new RuntimeException(e);
                    }
                });

                t.start();
                threads.add(t);
            }

            for (Thread t : threads) {
                t.join();
            }


            System.out.println("END :: /test ENDPOINT");
            return new ResponseEntity<>(HttpStatusCode.valueOf(200));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new RuntimeException(e);
        }
    }
}
