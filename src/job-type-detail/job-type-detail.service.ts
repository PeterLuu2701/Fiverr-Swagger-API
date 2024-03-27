import { Injectable } from '@nestjs/common';
import { CreateJobTypeDetailDto, CreateJobTypeDetailListDto } from './dto/create-job-type-detail.dto';
import { UpdateJobTypeDetailDto } from './dto/update-job-type-detail.dto';
import { PrismaClient } from '@prisma/client';
import { JobTypeDetail } from './entities/job-type-detail.entity';
import { JobTypeDetailList } from './entities/job-type-detail-list.entity';

const prisma = new PrismaClient

@Injectable()
export class JobTypeDetailService {

  async createJobTypeDetail(createJobTypeDetailDto: CreateJobTypeDetailDto): Promise<JobTypeDetail>{
    try {
      const createJobTypeDetail = await prisma.jobTypeDetail.create({
        data: {
          job_type_detail_name: createJobTypeDetailDto.job_type_detail_name,
          image: createJobTypeDetailDto.image,
          job_type_id: createJobTypeDetailDto.job_type_id
        }
      });
      return createJobTypeDetail;
    } catch (error) {
      throw new Error('Failed to create job type detail');
    }
  }

  async createJobTypeDetailList(jobTypeDetailId: number, createJobTypeDetailListDto: CreateJobTypeDetailListDto): Promise<JobTypeDetailList>  {
    try {
      const createJobTypeDetailList = await prisma.jobTypeDetailList.create({
        data: {
          ... createJobTypeDetailListDto,
          job_type_detail_id:  jobTypeDetailId,
        },
      });
      return createJobTypeDetailList;
    } catch (error) {
      throw new Error('Failed to create job type detail');
    }
  }

  async findAll() {
    try {
      const allJobTypeDetail = await prisma.jobTypeDetail.findMany();
      return allJobTypeDetail;
    } catch (error) {
      throw new Error('Failed to retrieve job types');
    }
  }

  async findOne(id: number) {
    try {
      const jobTypeDetil = await prisma.jobTypeDetail.findFirst({
        where: {
          id: id
        }
      });
      return jobTypeDetil;
    } catch (error) {
      throw new Error('Failed to retrieve job types');
    }
  }

  async update(id: number, updateJobTypeDetailDto: UpdateJobTypeDetailDto) {
    try {
      // Retrieve the current job type detail
      const existingJobTypeDetail = await prisma.jobTypeDetail.findUnique({
        where: { id: id }
      });

      // Prepare the data to be updated
      const updateData = { ...existingJobTypeDetail };

      // Update only if the provided value is different from the default value from the body
      if (updateJobTypeDetailDto.job_type_detail_name !== "string" && updateJobTypeDetailDto.job_type_detail_name !== existingJobTypeDetail.job_type_detail_name) {
        updateData.job_type_detail_name = updateJobTypeDetailDto.job_type_detail_name;
      }

      if (updateJobTypeDetailDto.image !== "string" && updateJobTypeDetailDto.image !== existingJobTypeDetail.image) {
        updateData.image = updateJobTypeDetailDto.image;
      }

      if (updateJobTypeDetailDto.job_type_id !== 0 && updateJobTypeDetailDto.job_type_id !== existingJobTypeDetail.job_type_id) {
        updateData.job_type_id = updateJobTypeDetailDto.job_type_id;
      }

      // Update only the changed information
      const updatedJobTypeDetail = await prisma.jobTypeDetail.update({
        where: { id: id },
        data: updateData,
      });

      return updatedJobTypeDetail;
    } catch (error) {
      throw new Error('Failed to update job type detail');
    }
  }

  remove(id: number) {
    return `This action removes a #${id} jobTypeDetail`;
  }
}
