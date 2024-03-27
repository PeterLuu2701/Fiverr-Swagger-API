import { Injectable } from '@nestjs/common';
import { CreateJobTypeDto } from './dto/create-job-type.dto';
import { UpdateJobTypeDto } from './dto/update-job-type.dto';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

@Injectable()
export class JobTypeService {

  async create(createJobTypeDto: CreateJobTypeDto) {
    try {
      const createJobType = await prisma.jobType.create({
        data: {
          job_type_name: createJobTypeDto.job_type_name
        }
      });
      return createJobType;
    } catch (error) {
      throw new Error('Failed to create job type');
    }
  }

  async findAll() {
    try {
      const allJobTypes = await prisma.jobType.findMany(); 
      return allJobTypes;
    } catch (error) {
      throw new Error('Failed to retrieve job types');
    }
  }

  async findOne(id: number) {
    try {
      const jobType = await prisma.jobType.findFirst({
        where: {
          id: id
        }
      }); 
      return jobType;
    } catch (error) {
      throw new Error('Failed to retrieve job types');
    }
  }

  async update(id: number, updateJobTypeDto: UpdateJobTypeDto) {
    try {
      const jobType = await prisma.jobType.update({
        where: {
          id: id
        },
        data: updateJobTypeDto // Provide the data to update the job type
      });
      return jobType;
    } catch (error) {
      throw new Error('Failed to update job type');
    }
  }

  async remove(id: number) {
    try {
      const jobType = await prisma.jobType.delete({
        where: {
          id: id
        }
      });
      return jobType;
    } catch (error) {
      throw new Error('Failed to delete job type');
    }
  }
}
