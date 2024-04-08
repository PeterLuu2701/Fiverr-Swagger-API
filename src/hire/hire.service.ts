import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateHireDto } from './dto/create-hire.dto';
import { UpdateHireDto } from './dto/update-hire.dto';
import { PrismaClient } from '@prisma/client';
import { ApiBody, ApiParam } from '@nestjs/swagger';
import { UpdateCompletedHireDto } from './dto/update-completed-hire.dto';

const prisma = new PrismaClient

@Injectable()
export class HireService {

    async create(createHireDto: CreateHireDto) {
      try {
        const createComment = await prisma.hire.create({
          data: {
            job_id: createHireDto.job_id,
            user_id: createHireDto.user_id,
            hire_date: createHireDto.hire_date,
            complete: createHireDto.complete,
          }
        });
        return createComment;
      } catch (error) {
        throw new Error(error);
      }
    }

  async findAll() {
    try {
      const getAllHirings = await prisma.hire.findMany();
      return getAllHirings;
    } catch (error) {
      throw new Error(error);
    }
  }

  async findOne(id: number) {
    try {
      const getHiringById = await prisma.hire.findFirst({
        where:{
          id: id
        }
      });
      return getHiringById;
    } catch (error) {
      throw new Error(error);
    }
  }

  async findHired(id: number) {
    try {
      const getHired = await prisma.hire.findMany({
        where: {
          user_id: id
        }
      });
      return getHired;
    } catch (error) {
      throw new Error(error);
    }
  }

  async update(id: number, updateHireDto: UpdateHireDto) {
    try {
      const updatedHiring = await prisma.hire.update({
        where: { id: id },
        data: updateHireDto,
      });
      return updatedHiring;
    } catch (error) {
      throw new Error(error);
    }
  }

  async remove(id: number) {
    try {
      const deletedHiring = await prisma.hire.delete({
        where: {
          id: id
        }
      });
      return deletedHiring;
    } catch (error) {
      throw new Error(error);
    }
  }

  async updateCompleted(id: number, updateCompletedHireDto: UpdateCompletedHireDto) {
    try {
      const hire = await prisma.hire.findUnique({
        where: { id: id },
      });

      if (!hire) {
        throw new NotFoundException('Hire not found');
      }

      if (hire.complete === updateCompletedHireDto.complete) {
        return 'Already Completed';
      }

      const updateCompletedHire = await prisma.hire.update({
        where: { id },
        data: { complete: updateCompletedHireDto.complete },
      });
      return updateCompletedHire;
    } catch (error) {
      throw new Error(error);
    }
  }
}
