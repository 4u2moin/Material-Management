package com.assesment.materialmanagement.util;

import com.assesment.materialmanagement.repository.MaterialRepository;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.time.Year;

@Component
public class ExternalIdUtil implements ApplicationContextAware {

    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) {
        context = applicationContext;
    }

    public static String generateExternalId(String prefix) {
        MaterialRepository materialRepository = context.getBean(MaterialRepository.class);

        String lastId = materialRepository.findLastExternalId(prefix);
        int nextSeq = 1;

        if (lastId != null) {
            // Assuming format: PREFIX-YYYY-XXXX
            String[] parts = lastId.split("-");
            if (parts.length == 3) {
                try {
                    nextSeq = Integer.parseInt(parts[2]) + 1;
                } catch (NumberFormatException ignored) {
                }
            }
        }

        return String.format("%s-%d-%04d", prefix, Year.now().getValue(), nextSeq);
    }
}
