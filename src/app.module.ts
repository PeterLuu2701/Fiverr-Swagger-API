import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { JobTypeModule } from './job-type/job-type.module';
import { JobTypeDetailModule } from './job-type-detail/job-type-detail.module';
import { UserModule } from './user/user.module';
import { JobModule } from './job/job.module';
import { CommentModule } from './comment/comment.module';
import { HireModule } from './hire/hire.module';

@Module({
  imports: [AuthModule, ConfigModule, JobTypeModule, JobTypeDetailModule, UserModule, JobModule, CommentModule, HireModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
