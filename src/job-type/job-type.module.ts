import { Module } from '@nestjs/common';
import { JobTypeService } from './job-type.service';
import { JobTypeController } from './job-type.controller';
import { ConfigModule, ConfigService } from '@nestjs/config';

@Module({
  imports: [ConfigModule],
  controllers: [JobTypeController],
  providers: [JobTypeService, ConfigService],
})
export class JobTypeModule {}
