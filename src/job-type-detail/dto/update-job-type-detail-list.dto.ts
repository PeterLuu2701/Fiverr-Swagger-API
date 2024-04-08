import { PartialType } from '@nestjs/swagger';
import { CreateJobTypeDetailListDto } from './create-job-type-detail-list.dto';

export class UpdateJobTypeDetailListDto extends PartialType(CreateJobTypeDetailListDto) { }