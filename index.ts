import { CronJob } from 'cron';
import { TIMES } from './config';
import { $ } from 'bun';

for (const time of TIMES) {
  const job = new CronJob(time, () => {
    $`git pull origin main`;
  });

  job.start();
}
