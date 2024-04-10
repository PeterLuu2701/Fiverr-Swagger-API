import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, UseInterceptors, UploadedFile } from '@nestjs/common';
import { JobTypeDetailListService, JobTypeDetailService } from './job-type-detail.service';
import { CreateJobTypeDetailDto } from './dto/create-job-type-detail.dto';
import { CreateJobTypeDetailListDto } from './dto/create-job-type-detail-list.dto';
import { UpdateJobTypeDetailDto } from './dto/update-job-type-detail.dto';
import { ApiBearerAuth, ApiBody, ApiConsumes, ApiProperty, ApiTags } from '@nestjs/swagger';
import { JobTypeDetailList } from './entities/job-type-detail-list.entity';
import { UpdateJobTypeDetailListDto } from './dto/update-job-type-detail-list.dto';
import { AuthGuard } from '@nestjs/passport';
import { FileUploadDto } from './entities/job-type-detail.entity';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';

const upload = {
  storage: diskStorage({
    destination: process.cwd() + "/public/img",
    filename: (req, file, callback) => callback(null, new Date().getTime() + "_" + file.originalname)
  })
}

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
  constructor(private readonly jobTypeDetailService: JobTypeDetailService, private readonly jobTypeDetailListService: JobTypeDetailListService) {}

  // @ApiBody({ type: jobTypeDetailType })
  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post('create-job-type-detail')
  create(@Body() jobTypeDetail: CreateJobTypeDetailDto) {
    return this.jobTypeDetailService.createJobTypeDetail(jobTypeDetail);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Post('create-job-type-detail-list/:jobTypeDetailId')
  createJobTypeDetailList(
    @Body() jobTypeDetailList: CreateJobTypeDetailListDto,
    @Param('jobTypeDetailId') jobTypeDetailId: string,
  ): Promise<JobTypeDetailList> {
    return this.jobTypeDetailService.createJobTypeDetailList(jobTypeDetailId, jobTypeDetailList);
  }

  @Get()
  findAll() {
    return this.jobTypeDetailService.findAll();
  }

  @Get('get-job-type-detail-by-id/:id')
  findOne(@Param('id') id: string) {
    return this.jobTypeDetailService.findOne(+id);
  }

  // @ApiBody({ type: jobTypeDetailType })
  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Patch('update-job-type-detail-by-id/:id')
  update(@Param('id') id: string, @Body() updateJobTypeDetailDto: UpdateJobTypeDetailDto) {
    return this.jobTypeDetailService.update(+id, updateJobTypeDetailDto);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Patch('update-job-type-detail-list-by-id/:id')
  updateJobTypeDetailList(@Param('id') id: string, @Body() updateJobTypeDetailListDto: UpdateJobTypeDetailListDto) {
    return this.jobTypeDetailListService.update(+id, updateJobTypeDetailListDto);
  }

  @ApiBearerAuth()
  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.jobTypeDetailService.remove(+id);
  }

  @ApiConsumes('multipart/form-data')
  @ApiBody({ type: FileUploadDto })
  // yarn add @types/multer
  @UseInterceptors(FileInterceptor("upload", upload))
  @Patch('/upload-job-type-detail-picture-by-id/:id')
  uploadPictureById(@UploadedFile() file: Express.Multer.File, @Param('id') id: string) {
    return file
  }
}
