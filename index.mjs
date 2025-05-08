import { CONFIG } from './config.mjs';
import { CronJob } from 'cron';
import exec from 'node:child_process';

for (const { path, times } of CONFIG) {
  for (const time of times) {
    const job = new CronJob(time, async () => {
      try {
        console.log(`Pulling ${path}`);
        const result = await exec(`cd ${path} && git pull origin main`);
        console.log(result.exitCode);
        console.log(result.text());
      } catch (error) {
        console.error(`❌ Error pulling ${path}`);
        console.error(error);
      }
    });

    console.log(`Starting job for ${path} at ${time}`);

    job.start();
  }
}
