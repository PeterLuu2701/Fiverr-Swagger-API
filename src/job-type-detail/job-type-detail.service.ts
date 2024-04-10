import { Injectable } from '@nestjs/common';
import { CreateJobTypeDetailDto } from './dto/create-job-type-detail.dto';
import { UpdateJobTypeDetailDto } from './dto/update-job-type-detail.dto';
import { PrismaClient } from '@prisma/client';
import { JobTypeDetail } from './entities/job-type-detail.entity';
import { JobTypeDetailList } from './entities/job-type-detail-list.entity';
import { CreateJobTypeDetailListDto } from './dto/create-job-type-detail-list.dto';
import { UpdateJobTypeDetailListDto } from './dto/update-job-type-detail-list.dto';
import * as jwt from 'jsonwebtoken';

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
      throw new Error(error);
    }
  }

  async createJobTypeDetailList(jobTypeDetailId: string, createJobTypeDetailListDto: CreateJobTypeDetailListDto): Promise<JobTypeDetailList>  {
    try {
      const createJobTypeDetailList = await prisma.jobTypeDetailList.create({
        data: {
          job_type_detail_id: Number(jobTypeDetailId),
          detail_name: createJobTypeDetailListDto.detail_name
        },
      });
      return createJobTypeDetailList;
    } catch (error) {
      throw new Error(error);
    }
  }

  async findAll() {
    try {
      const allJobTypeDetail = await prisma.jobTypeDetail.findMany();

      // Fetch JobTypeDetailList for each JobTypeDetail instance
      const jobTypeDetailsWithLists = await Promise.all(
        allJobTypeDetail.map(async (jobTypeDetail) => {
          const jobTypeDetailList = await prisma.jobTypeDetailList.findMany({
            where: {
              job_type_detail_id: jobTypeDetail.id
            }
          });
          return { ...jobTypeDetail, jobTypeDetailList };
        })
      );

      return jobTypeDetailsWithLists;
    } catch (error) {
      throw new Error(error);
    }
  }

  async findOne(id: number) {
    try {
      const jobTypeDetail = await prisma.jobTypeDetail.findFirst({
        where: {
          id: id
        }
      });

      const jobTypeDetailList = await prisma.jobTypeDetailList.findMany({
        where: {
          job_type_detail_id: jobTypeDetail.id
        }
      });

      // Attach the job type detail list to the job type detail object
      const jobTypeDetailWithList = {
        ...jobTypeDetail,
        jobTypeDetailList: jobTypeDetailList
      };

      return jobTypeDetailWithList;
    } catch (error) {
      throw new Error(error);
    }
  }

  // async update(id: number, updateJobTypeDetailDto: UpdateJobTypeDetailDto) {
  //   try {
  //     // Retrieve the current job type detail
  //     const existingJobTypeDetail = await prisma.jobTypeDetail.findUnique({
  //       where: { id: id }
  //     });

  //     // Prepare the data to be updated
  //     const updateData = { ...existingJobTypeDetail };

  //     // Update only if the provided value is different from the default value from the body
  //     if (updateJobTypeDetailDto.job_type_detail_name !== "string" && updateJobTypeDetailDto.job_type_detail_name !== existingJobTypeDetail.job_type_detail_name) {
  //       updateData.job_type_detail_name = updateJobTypeDetailDto.job_type_detail_name;
  //     }

  //     if (updateJobTypeDetailDto.image !== "string" && updateJobTypeDetailDto.image !== existingJobTypeDetail.image) {
  //       updateData.image = updateJobTypeDetailDto.image;
  //     }

  //     if (updateJobTypeDetailDto.job_type_id !== 0 && updateJobTypeDetailDto.job_type_id !== existingJobTypeDetail.job_type_id) {
  //       updateData.job_type_id = updateJobTypeDetailDto.job_type_id;
  //     }

  //     // Update only the changed information
  //     const updatedJobTypeDetail = await prisma.jobTypeDetail.update({
  //       where: { id: id },
  //       data: updateData,
  //     });

  //     return updatedJobTypeDetail;
  //   } catch (error) {
  //     throw new Error('Failed to update job type detail');
  //   }
  // }

  async update(id: number, updateJobTypeDetailDto: UpdateJobTypeDetailDto) {
    try {
      const updatedJobTypeDetail = await prisma.jobTypeDetail.update({
        where: {
          id: id
        },
        data: updateJobTypeDetailDto // Provide the data to update the job type
      });
      return updatedJobTypeDetail;
    } catch (error) {
      throw new Error(error);
    }
  }

  async remove(id: number) {
    try {
      const deleteJobTypeDetail = await prisma.jobTypeDetail.delete({
        where: {
          id: id
        }
      });
      return deleteJobTypeDetail;
    } catch (error) {
      throw new Error(error);
    }
  }

  async uploadPictureById(id: number, file: Express.Multer.File): Promise<any> {
    try {
      const encodedPicture = jwt.sign({ picture: file.buffer.toString('base64') }, 'SECRET_KEY', { algorithm: 'HS256' });
      
      const updatedJobTypeDetail = await prisma.jobTypeDetail.update({
        where: {
          id: id
        },
        data: {
          image: encodedPicture
        }
      });

      return updatedJobTypeDetail;
    } catch (error) {
      throw new Error(error);
    }
  }
}



@Injectable()
export class JobTypeDetailListService {
  constructor() { }

  async update(id: number, updateJobTypeDetailListDto: UpdateJobTypeDetailListDto) {
    try {
      const updatedJobTypeDetailList = await prisma.jobTypeDetailList.update({
        where: { id: id },
        data: updateJobTypeDetailListDto,
      });
      return updatedJobTypeDetailList;
    } catch (error) {
      throw new Error('Failed to update job type detail list');
    }
  }


}