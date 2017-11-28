package com.hm.gcjw.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.gcjw.entity.authority.ConfigEntity;
import com.hm.gcjw.repository.authority.ConfigRepository;

@Service
public class ConfigServiceImpl implements ConfigService {
	
	@Autowired
	ConfigRepository configRepository;

	@Override
	public ConfigEntity find() {
		ConfigEntity config = configRepository.findByName("config");
		if (config == null) {
			config = new ConfigEntity();
			configRepository.save(config);
		}
		return config;
	}

	@Override
	public void save(ConfigEntity config) {
		configRepository.save(config);
	}

	@Override
	public List<ConfigEntity> list() {
		return (List<ConfigEntity>) configRepository.findAll();
	}

}
