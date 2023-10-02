package com.example.arquitera_software;

import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
public class TestController {

    private static final int NUMBER_OF_THREADS = 1000;
    private static final int NUMBER_OF_MULTIPLICATIONS = 5000;
    @GetMapping("/")
    public ResponseEntity<Void> testEndpoint() {
        System.out.println("START :: /test ENDPOINT");
        try {
            List<Thread> threads = new ArrayList<>();
            for (int i = 0; i < NUMBER_OF_THREADS; i++) {
                Thread t = new Thread(() -> {
                    for (int j = 0; j < NUMBER_OF_MULTIPLICATIONS; j ++) {
                        Random random = new Random();
                        double result = random.nextDouble() * random.nextDouble();
                        System.out.println("result :: " + result);
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
