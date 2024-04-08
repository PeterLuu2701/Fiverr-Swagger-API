import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient

@Injectable()
export class UserService {

  async create(createUserDto: CreateUserDto) {
    try {
      const createUser = await prisma.user.create({
        data: {
          name: createUserDto.name,
          email: createUserDto.email,
          password: createUserDto.password,
          phone: createUserDto.phone,
          birthday: createUserDto.birthday,
          gender: createUserDto.gender,
          role: createUserDto.role
        }
      });
      return createUser;
    } catch (error) {
      throw new Error('Failed to create user');
    }
  }

  async findAll() {
    try {
      const allUsers = await prisma.user.findMany();
      return allUsers;
    } catch (error) {
      throw new Error('Failed to get all users');
    }
  }

  async findOneById(id: number) {
    try {
      const userById = await prisma.user.findFirst({
        where: {
          id: id
        }
      });
      return userById;
    } catch (error) {
      throw new Error('Failed to get user');
    }
  }

  async findOneByUserName(userName: string) {
    try {
      const userByName = await prisma.user.findMany({
        where: {
          name: {
            contains: userName
        }
      }});
      return userByName;
    } catch (error) {
      throw new Error('Failed to get user');
    }
  }

  async update(id: number, updateUserDto: UpdateUserDto) {
    try {
      const updatedUser = await prisma.user.update({
        where: { id: id },
        data: updateUserDto,
      });
      return updatedUser;
    } catch (error) {
      throw new Error(error);
    }
  }

  async remove(id: number) {
    try {
      const deletedUser = await prisma.user.delete({
        where: { id: id },
      });
      return deletedUser;
    } catch (error) {
      throw new Error(error);
    }
  }
}
