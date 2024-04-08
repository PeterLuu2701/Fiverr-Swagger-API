import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { JobService } from './job.service';
import { CreateJobDto } from './dto/create-job.dto';
import { UpdateJobDto } from './dto/update-job.dto';
import { ApiBearerAuth, ApiBody, ApiProperty, ApiTags } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';

class job {
  @ApiProperty()
  job_name: string

  @ApiProperty()
  rate: number

  @ApiProperty()
  salary: number

  @ApiProperty()
  image: string

  @ApiProperty()
  job_title: string

  @ApiProperty()
  job_sub_title: string

  @ApiProperty()
  job_star: number

  @ApiProperty()
  job_type_detail_id: number

  @ApiProperty()
  user_id: number
}

@ApiTags('job')
@Controller('job')
export class JobController {
  constructor(private readonly jobService: JobService) {}

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @ApiBody({ type: job })
  @Post('create-job')
  signUp(@Body() job: job) {
    return this.jobService.create(job);
  }

  @Get()
  findAll() {
    return this.jobService.findAll();
  }

  @Get('get-job-by-id/:id')
  findOneById(@Param('id') id: string) {
    return this.jobService.findOneById(+id);
  }

  @Get('get-job-by-job-name/:jobName')
  findOneByJobName(@Param('jobName') job_name: string) {
    return this.jobService.findOneByJobName(job_name);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Patch('update-job-by-id/:id')
  update(@Param('id') id: string, @Body() updateJobDto: UpdateJobDto) {
    return this.jobService.update(+id, updateJobDto);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.jobService.remove(+id);
  }
}
