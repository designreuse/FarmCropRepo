package com.sourcetrace.eses.adapter.core;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sourcetrace.eses.service.IAgentService;

@Component
@Configuration
@EnableScheduling
public class MobileUserProcessSchedulerTask {

	@Autowired
	private IAgentService agentService;

	@Scheduled(fixedDelay = 1200000, initialDelay = 0)
	public void process() {

		List<Object[]> agentList = agentService.fetchAvailableAgentsToProcess();

		if (agentList.size() > 0) {

			List<String> profIds = new ArrayList<String>();

			agentList.stream().forEach(a -> {

				String username = String.valueOf(a[0]);
				String first_name = String.valueOf(a[1]);
				String last_name = String.valueOf(a[2]);
				String email = String.valueOf(a[3]);
				String mobile = String.valueOf(a[4]);

				String urlStr = "http://marketplace.thefarmcorp.com//registerapi?JSON=";
				String params = "{\"username\": \"" + username + "\",\"first_name\": \"" + first_name
						+ "\",\"last_name\": \"" + last_name + "\",\"email\": \"" + email + "\",\"password\": \""
						+ mobile + "\",\"confirm_password\": \"" + mobile
						+ "\",\"terms\": \"on\",\"sys_lang_id\": \"1\",\"mobile\":\"" + mobile
						+ "\",\"role\":\"member\",\"role_id\":\"0\"}";

				urlStr = urlStr + encode(params);
				try {

					URI uri = new URI(urlStr);
					URL url = uri.toURL();

					HttpURLConnection conection = (HttpURLConnection) url.openConnection();
					int responseCode = conection.getResponseCode();
					
					// String responseMsg = conection.getResponseMessage();
					System.out.println(url.getPath());
					if (responseCode == 200) {
						profIds.add(username);
					}
				} catch (URISyntaxException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			});

			if (profIds.size() > 0) {
				agentService.setMarketPlaceEnableForAgents(profIds);
			}
		}

	}

	public String encode(String url) {
		try {
			String encodeURL = URLEncoder.encode(url, "UTF-8");
			return encodeURL;
		} catch (UnsupportedEncodingException e) {
			return "Issue while encoding" + e.getMessage();
		}
	}
}
