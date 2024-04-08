import { Injectable } from '@nestjs/common';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentDto } from './dto/update-comment.dto';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient

@Injectable()
export class CommentService {

  async create(createCommentDto: CreateCommentDto) {
    try {
      const createComment = await prisma.comment.create({
        data: {
          job_id: createCommentDto.job_id,
          user_id: createCommentDto.user_id,
          comment_date: createCommentDto.comment_date,
          content: createCommentDto.content,
          comment_star: createCommentDto.comment_star
        }
      });
      return createComment;
    } catch (error) {
      throw new Error(error);
    }
  }

  async findAll() {
    try {
      const getAllComments = await prisma.comment.findMany();
      return getAllComments;
    } catch (error) {
      throw new Error(error);
    }
  }

  async findOne(id: number) {
    try {
      const commentsByJobId = await prisma.comment.findMany({
        where: {
          job_id: id
        }
      });
      return commentsByJobId;
    } catch (error) {
      throw new Error(error);
    }
  }

  async update(id: number, updateCommentDto: UpdateCommentDto) {
    try {
      const updatedComment = await prisma.comment.update({
        where: { id: id },
        data: updateCommentDto,
      });
      return updatedComment;
    } catch (error) {
      throw new Error(error);
    }
  }

  async remove(id: number) {
    try {
      const deletedComment = await prisma.comment.delete({
        where: { id: id },
      });
      return deletedComment;
    } catch (error) {
      throw new Error(error);
    }
  }
}

