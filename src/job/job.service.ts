import { Injectable } from '@nestjs/common';
import { CreateJobDto } from './dto/create-job.dto';
import { UpdateJobDto } from './dto/update-job.dto';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient

@Injectable()
export class JobService {

  async create(createJobDto: CreateJobDto) {
    try {
      const createJob = await prisma.job.create({
        data: {
          job_name: createJobDto.job_name,
          rate: createJobDto.rate,
          salary: createJobDto.salary,
          image: createJobDto.image,
          job_title: createJobDto.job_title,
          job_sub_title: createJobDto.job_sub_title,
          job_star: createJobDto.job_star,
          job_type_detail_id: createJobDto.job_type_detail_id,
          user_id: createJobDto.user_id
        }
      });
      return createJob;
    } catch (error) {
      throw new Error('Failed to create job');
    }
  }

  async findAll() {
    try {
      const allJobs = await prisma.job.findMany();
      return allJobs;
    } catch (error) {
      throw new Error('Failed to get all jobs');
    }
  }

  async findOneById(id: number) {
    try {
      const jobById = await prisma.job.findFirst({
        where: {
          id: id
        }
      });
      return jobById;
    } catch (error) {
      throw new Error('Failed to get job');
    }
  }

  async findOneByJobName(job_name: string) {
    try {
      const jobByJobName = await prisma.job.findMany({
        where: {
          job_name: {
            contains: job_name // Using 'contains' for a like operation
          }
        }
      });
      return jobByJobName;
    } catch (error) {
      throw new Error('Failed to get job');
    }
  }

  async update(id: number, updateJobDto: UpdateJobDto) {
    try {
      const updatedJob = await prisma.job.update({
        where: { id: id },
        data: updateJobDto,
      });
      return updatedJob;
    } catch (error) {
      throw new Error(error);
    }
  }

  async remove(id: number) {
    try {
      const deletedJob = await prisma.job.delete({
        where: { id: id },
      });
      return deletedJob;
    } catch (error) {
      throw new Error(error);
    }
  }
}
