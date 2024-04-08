import { Module } from '@nestjs/common';
import { JobTypeDetailListService, JobTypeDetailService } from './job-type-detail.service';
import { JobTypeDetailController } from './job-type-detail.controller';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { JwtStrategy } from 'src/strategy/jwt.strategy';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [ConfigModule, AuthModule],
  controllers: [JobTypeDetailController],
  providers: [JobTypeDetailService, JobTypeDetailListService, ConfigService, JwtStrategy],
})
export class JobTypeDetailModule {}
