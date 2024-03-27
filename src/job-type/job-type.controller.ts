import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { JobTypeService } from './job-type.service';
import { CreateJobTypeDto } from './dto/create-job-type.dto';
import { UpdateJobTypeDto } from './dto/update-job-type.dto';
import { ApiBody, ApiProperty, ApiTags } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';

class jobTypeType {
  @ApiProperty()
  job_type_name: string
}

@ApiTags('jobType')
@Controller('job-type')
export class JobTypeController {
  constructor(private readonly jobTypeService: JobTypeService) {}

  // @UseGuards(AuthGuard('jwt'))
  @ApiBody({type: jobTypeType})
  @Post('create-job-type')
  create(@Body() jobType: jobTypeType) {
    return this.jobTypeService.create(jobType);
  }

  @Get()
  findAll() {
    return this.jobTypeService.findAll();
  }

  @Get('get-job-type-by-id/:id')
  findOne(@Param('id') id: string) {
    return this.jobTypeService.findOne(+id);
  }

  @ApiBody({ type: jobTypeType })
  @Patch('update-job-type-by-id/:id')
  update(@Param('id') id: string, @Body() updateJobTypeDto: UpdateJobTypeDto) {
    return this.jobTypeService.update(+id, updateJobTypeDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.jobTypeService.remove(+id);
  }
}
