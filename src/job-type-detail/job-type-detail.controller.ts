import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { JobTypeDetailService } from './job-type-detail.service';
import { CreateJobTypeDetailDto, CreateJobTypeDetailListDto } from './dto/create-job-type-detail.dto';
import { UpdateJobTypeDetailDto } from './dto/update-job-type-detail.dto';
import { ApiBody, ApiProperty, ApiTags } from '@nestjs/swagger';
import { jobTypeDetailList } from '@prisma/client';
import { JobTypeDetailList } from './entities/job-type-detail-list.entity';

// class jobTypeDetailType {
//   @ApiProperty()
//   job_type_detail_name: string

//   @ApiProperty()
//   image: string

//   @ApiProperty()
//   job_type_id: number

//   @ApiProperty()
//   job_type_detail_list: jobTypeDetailList[]
// }

@ApiTags('jobTypeDetail')
@Controller('job-type-detail')
export class JobTypeDetailController {
  constructor(private readonly jobTypeDetailService: JobTypeDetailService) {}

  // @ApiBody({ type: jobTypeDetailType })
  @Post('create-job-type-detail')
  create(@Body() jobTypeDetail: CreateJobTypeDetailDto) {
    return this.jobTypeDetailService.createJobTypeDetail(jobTypeDetail);
  }

  @Post('create-job-type-detail-list/:jobTypeDetailId')
  createDsChiTietLoai(
    @Body() jobTypeDetailList: CreateJobTypeDetailListDto,
    @Param('jobTypeDetailId') jobTypeDetailId: number,
  ): Promise<JobTypeDetailList> {
    return this.jobTypeDetailService.createJobTypeDetailList(jobTypeDetailId, jobTypeDetailList);
  }

  @Get()
  findAll() {
    return this.jobTypeDetailService.findAll();
  }

  @Get(':id')
  findOne(@Param('get-job-type-detail-by-id/id') id: string) {
    return this.jobTypeDetailService.findOne(+id);
  }

  // @ApiBody({ type: jobTypeDetailType })
  @Patch('update-job-type-detail-by-id/:id')
  update(@Param('id') id: string, @Body() updateJobTypeDetailDto: UpdateJobTypeDetailDto) {
    return this.jobTypeDetailService.update(+id, updateJobTypeDetailDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.jobTypeDetailService.remove(+id);
  }
}
