package com.sourcetrace.eses.adapter.core;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

	@Scheduled(fixedDelay = 1, initialDelay = 0)
	public void process() {
		List<Object[]> agentList = agentService.fetchAvailableAgentsToProcess();
		List<String> profIds = new ArrayList<String>();
		agentList.stream().forEach(a -> {

			
			/*
			 * String url =
			 * "http://marketplace.thefarmcorp.com//registerapi?JSON={\"username\": \"" +
			 * username + "\",\"first_name\": \"" + first_name + "\",\"last_name\": \"" +
			 * last_name + "\",\"email\": \"" + email + "\",\"password\": \"" + mobile +
			 * "\",\"confirm_password\": \"" + mobile +
			 * "\",\"terms\": \"on\",\"sys_lang_id\": \"1\",\"mobile\":\"" + mobile +
			 * "\",\"role\":\"member\",\"role_id\":\"0\"}";
			 */

			// url =
			// "http://marketplace.thefarmcorp.com//registerapi?JSON={%22username%22:%20%22jana98%22,%22first_name%22:%20%22Jana98%22,%22last_name%22:%20%22Priya98%22,%22email%22:%20%22janapriya1@sourcetrace.com98%22,%22password%22:%20%229500123659%22,%22confirm_password%22:%20%229500123659%22,%22terms%22:%20%22on%22,%22sys_lang_id%22:%20%221%22,%22mobile%22:%229500123659%22,%22role%22:%22member%22,%22role_id%22:%220%22}";

			String username = String.valueOf(a[0]);
			String first_name = String.valueOf(a[1]);
			String last_name = String.valueOf(a[2]);
			String email = String.valueOf(a[3]);
			String mobile = String.valueOf(a[4]);

			String url = "http://marketplace.thefarmcorp.com//registerapi?JSON=";
			String params = "{\"username\": \"" + username + "\",\"first_name\": \"" + first_name
					+ "\",\"last_name\": \"" + last_name + "\",\"email\": \"" + email + "\",\"password\": \"" + mobile
					+ "\",\"confirm_password\": \"" + mobile
					+ "\",\"terms\": \"on\",\"sys_lang_id\": \"1\",\"mobile\":\"" + mobile
					+ "\",\"role\":\"member\",\"role_id\":\"0\"}";

			try {
				URL urlForGetRequest = new URL(url);
				HttpURLConnection conection = (HttpURLConnection) urlForGetRequest.openConnection();
				conection.setRequestProperty("username", username);
				conection.setRequestProperty("first_name", first_name);
				conection.setRequestProperty("last_name", last_name);
				conection.setRequestProperty("email", email);
				conection.setRequestProperty("password", mobile);
				conection.setRequestProperty("confirm_password", mobile);
				conection.setRequestProperty("terms", "on");
				conection.setRequestProperty("sys_lang_id", "1");
				conection.setRequestProperty("mobile", mobile);
				conection.setRequestProperty("role", "member");
				conection.setRequestProperty("role_id", "0");
				int responseCode = conection.getResponseCode();
				String responseMsg = conection.getResponseMessage();
				if (responseCode == 200) {
					profIds.add(username);
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}

		});

		if (profIds.size() > 0) {
			agentService.setMarketPlaceEnableForAgents(profIds);
		}
	}

}
