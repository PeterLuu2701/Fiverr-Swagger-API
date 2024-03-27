import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { JobTypeModule } from './job-type/job-type.module';
import { JobTypeDetailModule } from './job-type-detail/job-type-detail.module';

@Module({
  imports: [AuthModule, ConfigModule, JobTypeModule, JobTypeDetailModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
