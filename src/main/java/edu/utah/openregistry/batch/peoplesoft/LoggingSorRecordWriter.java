package edu.utah.openregistry.batch.peoplesoft;

import org.openregistry.core.domain.sor.ReconciliationCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Just for the purpose of incrementally developing the inbound batch job. To be removed later...
 * @author Dmitriy Kopylenko
 */
public class LoggingSorRecordWriter {

	private static final Logger logger = LoggerFactory.getLogger(LoggingSorRecordWriter.class);

	public void logReconciliationCriteria(ReconciliationCriteria reconciliationCriteria) {
		logger.info("ReconciliationCriteria received: {}", reconciliationCriteria);
	}
}
