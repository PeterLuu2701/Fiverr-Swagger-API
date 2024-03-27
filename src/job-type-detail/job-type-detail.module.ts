import { Module } from '@nestjs/common';
import { JobTypeDetailService } from './job-type-detail.service';
import { JobTypeDetailController } from './job-type-detail.controller';
import { ConfigModule, ConfigService } from '@nestjs/config';

@Module({
  imports: [ConfigModule],
  controllers: [JobTypeDetailController],
  providers: [JobTypeDetailService, ConfigService],
})
export class JobTypeDetailModule {}
